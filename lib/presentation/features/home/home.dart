import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/spacing.dart';
import '../../../models/screen_arguments.dart';
import '../../../models/note_model.dart';
import '../../bloc/note_bloc/note_bloc.dart';
import '../edit/add_edit.dart';
import 'widgets/barrel.dart';

import '../../../common/extension/ellipsis.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteBloc>(context)..add(NoteLoadedEvent());
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _launchUrl() async {
    if (await launchUrl(
      Uri.parse("https://www.buymeacoffee.com/devlonoah"),
    )) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBarAndSettingsButton(
        context,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text("Buy me a coffee"),
                  content: Text("Support me so this app can remain ad free."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Another Time")),
                    TextButton(
                        onPressed: () async {
                          if (await launchUrl(
                              Uri.parse(
                                  "https://www.buymeacoffee.com/devlonoah"),
                              mode: LaunchMode.externalApplication)) {}
                        },
                        child: Text("Continue")),
                  ],
                );
              });
        },
      ),
      // endDrawer: EndDrawerWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(child: HomeBody()),
      floatingActionButton: FloatingActionButton(
        key: Key('Add_Note'),
        onPressed: () {
          Navigator.pushNamed(context, AddEdit.id,
              arguments: ScreenArgument(isNewNote: true));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 14,
        left: 14,
        top: 0,
      ),
      child: Column(
        children: [
          //TODO: Next update
          // BlocBuilder<NoteBloc, NoteState>(
          //   builder: (context, state) {
          //     final List<NoteModel> noteState =
          //         state is NoteLoadingSuccess ? state.notes : [];
          //     return SearchBar(
          //       onTap: () => showSearch(
          //         context: context,
          //         delegate:
          //             MySearchDelegate(context: context, notes: noteState),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(height: 10),
          addVerticalSpace(10),
          Expanded(
            child: BlocConsumer<NoteBloc, NoteState>(
              listener: (context, state) {
                if (state is NoteLoadingFailure) _showSnackBar(context);
              },
              builder: (context, state) {
                if (state is NoteLoadInProgress) {
                  return LoadingWidget();
                }

                if (state is NoteLoadingSuccess) {
                  if (state.notes.length == 0) {
                    return Center(
                      child: Text(
                        'Add note',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  } else {
                    return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, x) {
                        return Divider(
                          color: Colors.transparent,
                        );
                      },
                      itemCount: state.notes.length,
                      itemBuilder: (context, x) {
                        NoteModel _note = state.notes[x];

                        return Dismissible(
                          onDismissed: (x) => context
                              .read<NoteBloc>()
                              .add(NoteDeletedEvent(_note)),
                          key: Key(_note.hashCode.toString()),
                          child: NoteWidget(
                            note: _note,
                            onTap: () {
                              Navigator.pushNamed(context, AddEdit.id,
                                  arguments: ScreenArgument(
                                      isNewNote: false, noteId: _note.id));
                              // Navigator.pushNamed(
                              //   context,
                              //   Read.id,
                              //   arguments: ScreenArgument(
                              //       isNewNote: false, noteId: _note.id),
                              // );
                            },
                          ),
                        );
                      },
                    );
                  }
                }

                return LoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Error loading note'),
        ),
      );
  }
}

class NoteWidget extends StatelessWidget {
  final NoteModel note;
  final void Function()? onTap;
  const NoteWidget({Key? key, required this.note, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note.title.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  note.note != null
                      ? Text(
                          note.note!.addEllipsis(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.grey),
                        )
                      : SizedBox(),
                  SizedBox(height: 8),
                  Text(
                    note.dateCreated.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(100),
            //   child: Material(
            //     // color: Color,
            //     child: InkWell(
            //       onTap: () => _navigateToEditPage(context, note.id),
            //       customBorder: CircleBorder(),
            //       child: Container(
            //         padding: EdgeInsets.all(10.0),
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //         ),
            //         child: Icon(
            //           // Icons.delete,
            //           FontAwesomeIcons.pen,
            //           size: 10,
            //           color: Colors.white,
            //           // color: Theme.of(context).iconTheme.color,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Colors.amber, strokeWidth: 10.r),
    );
  }
}

void _navigateToEditPage(BuildContext context, String? noteId) {
  Navigator.pushNamed(context, AddEdit.id,
      arguments: ScreenArgument(isNewNote: false, noteId: noteId));
}
