import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/common/screen_arguments.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/widgets/add_note_widget.dart';

import 'widgets/edit_note_widget.dart';

class AddEdit extends StatelessWidget {
  final int? noteId;

  static String id = 'AddEdit';
  const AddEdit({
    Key? key,
    this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = (ModalRoute.of(context)?.settings.arguments) as ScreenArgument;
    return Scaffold(
      appBar: AppBar(),
      body: AddEditBody(noteId: args.noteId, isNewNote: args.isNewNote),
      backgroundColor: Colors.black,
    );
  }
}

class AddEditBody extends StatelessWidget {
  final int? noteId;
  final bool isNewNote;
  const AddEditBody({Key? key, required this.noteId, required this.isNewNote})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      final isNoteNull = noteId == null;

      if (isNoteNull) {
        return AddNoteWidget();
      } else {
        var notex = (state as NoteLoadingSuccess)
            .notes
            .firstWhere((note) => note.id == noteId);

        return EditNoteWidget(note: notex);
      }

      // ignore: unnecessary_statements

      // return isNewNote ? AddNoteWidget() : EditNoteWidget(note: notex!);
    });
  }
}





//TODO: Work on the constructor