import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/models/screen_arguments.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/bloc/bloc/barrel.dart';
import 'package:huawei_contest/presentation/features/edit/widgets/barrel.dart';

import 'widgets/edit_note_widget.dart';

class AddEdit extends StatelessWidget {
  final String? noteId;

  static String id = 'AddEdit';
  const AddEdit({
    Key? key,
    this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        final isNoteNull = noteId == null;
        var arg =
            (ModalRoute.of(context)?.settings.arguments) as ScreenArgument;
        if (isNoteNull && arg.isNewNote) {
          return BlocProvider<EditBloc>(
            create: (context) => EditBloc(),
            child: AddNoteWidget(),
          );
        } else {
          var notex = (state as NoteLoadingSuccess)
              .notes
              .firstWhere((note) => arg.noteId == note.id);

          return EditNoteWidget(note: notex);
        }
      },
    );
  }
}
