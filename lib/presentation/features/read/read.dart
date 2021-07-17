import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/common/screen_arguments.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/add_edit.dart';

class Read extends StatelessWidget {
  static String id = 'Read';

  Read({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int args = (ModalRoute.of(context)!.settings.arguments) as int;

    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        final note = (state as NoteLoadingSuccess)
            .notes
            .firstWhere((todo) => args == todo.id);

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<NoteBloc>(context)
                      ..add(NoteDeletedEvent(note));
                  },
                  icon: Icon(Icons.delete_forever))
            ],
          ),
          body: Body(note: note),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Edit',
            onPressed: () => Navigator.pushNamed(
              context,
              AddEdit.id,
              arguments: ScreenArgument(isNewNote: false, noteId: note.id),
            ),
            child: Icon(Icons.edit),
          ),
        );
      },
    );
  }
}

class Body extends StatelessWidget {
  final NoteEntity note;

  const Body({Key? key, required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title.toString(),
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(note.dateCreated.toString(),
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        )),
                SizedBox(
                  width: DS.sw * 0.03,
                ),
                Container(
                  color: Colors.grey,
                  width: 3.0,
                  height: 25.0,
                ),
                SizedBox(
                  width: DS.sw * 0.03,
                ),
                Text('CHARACTER COUNT ')
              ],
            ),
            SizedBox(
              height: DS.sh * 0.03,
            ),
            Expanded(child: Text(note.note.toString()))
          ],
        ));
  }
}



//TODO: Work on the constructor