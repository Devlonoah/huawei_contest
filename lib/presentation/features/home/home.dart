import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/spacing.dart';
import '../../../models/screen_arguments.dart';
import '../../../core/device_size.dart';
import '../../../models/note_model.dart';
import '../../bloc/note_bloc/note_bloc.dart';
import '../edit/add_edit.dart';
import 'widgets/barrel.dart';

import '../read/read.dart';
import '../../../common/extension/ellipsis.dart';
import 'widgets/appbar_and_settings_button.dart';

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

  @override
  Widget build(BuildContext context) {
    DS.init(context);
    return Scaffold(
      appBar: appBarAndSettingsButton(context),
      endDrawer: EndDrawerWidget(),
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
        right: DS.sw * 0.02,
        left: DS.sw * 0.02,
        top: DS.sh * 0.01,
      ),
      child: Column(
        children: [
          // SizedBox(height: DS.sh * 0.02),
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
          // SizedBox(height: DS.sh * 0.03),
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
                          color: Colors.white54,
                        );
                      },
                      itemCount: state.notes.length,
                      itemBuilder: (context, x) {
                        NoteModel _note = state.notes[x];

                        return Dismissible(
                          onDismissed: (x) => context.read<NoteBloc>()
                            ..add(NoteDeletedEvent(_note)),
                          key: Key(_note.hashCode.toString()),
                          child: NoteWidget(
                            note: _note,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Read.id,
                                arguments: ScreenArgument(
                                    isNewNote: false, noteId: _note.id),
                              );
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
        padding: EdgeInsets.symmetric(
            vertical: DS.sh * 0.02, horizontal: DS.sw * 0.03),
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
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  Text(
                    note.note!.addEllipsis(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                child: InkWell(
                  onTap: () => _navigateToEditPage(context, note.id),
                  customBorder: CircleBorder(),
                  child: Container(
                    padding: EdgeInsets.all(10.0.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      // Icons.delete,
                      FontAwesomeIcons.pen,
                      size: 12.r,
                      color: Colors.white,
                      // color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ),
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
