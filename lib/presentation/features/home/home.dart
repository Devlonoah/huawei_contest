import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huawei_contest/common/screen_arguments.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/di/injection.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/add_edit.dart';
import 'package:huawei_contest/presentation/features/home/widgets/search_bar.dart';
import 'package:huawei_contest/presentation/features/home/widgets/theme_switch.dart';
import 'package:huawei_contest/presentation/features/read/read.dart';
import 'package:huawei_contest/theme/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'widgets/header_and_theme_switch.dart';

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
      // backgroundColor: Colors.blueGrey,
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
          // SizedBox(
          //   height: DS.sh * 0.01,
          // ),
          HeaderAndThemeSwitch(),
          SizedBox(height: DS.sh * 0.02),
          SearchBar(
            onTap: () {
              print('Search bar');

              //TODO: go to search page
            },
          ),
          SizedBox(height: DS.sh * 0.03),
          Expanded(
            child: BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) {
                if (state is NoteLoadInProgress) {
                  return LoadingWidget();
                }

                if (state is NoteLoadingSuccess) {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: state.notes.length,
                    itemBuilder: (BuildContext context, int x) {
                      var note = state.notes[x];

                      return NoteWidget(
                          note: note,
                          onTap: () => Navigator.pushNamed(context, Read.id,
                              arguments: note.id));
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(1, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  );
                }

                return LoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class NoteWidget extends StatelessWidget {
  final NoteEntity note;
  final void Function()? onTap;
  const NoteWidget({Key? key, required this.note, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // borderOnForeground: true,
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

        decoration: BoxDecoration(
            color: Colors.grey,
            gradient: RadialGradient(
                focal: Alignment.bottomCenter,
                focalRadius: 0.5,
                center: Alignment.topRight,
                radius: 0.6,
                stops: [
                  0.2,
                  9
                ],
                colors: [
                  Colors.purple.withOpacity(0.2),
                  Colors.transparent,
                ]),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white24,
              width: 1.0,
            )),
        child: ListTile(
          title: Text(note.title.toString(),
              style: Theme.of(context).textTheme.headline5),
          subtitle: Text(
            addEllipsisToString(note.note!)!,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
          ),
        ),
      ),
    );
  }
}

String? addEllipsisToString(String value) {
  int _valueLength = value.length;
  if (_valueLength < 20) {
    return value;
  } else if (_valueLength > 20) {
    var newValue = value.substring(0, 12) + "...";

    return newValue;
  }
}
