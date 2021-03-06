import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/screen_arguments.dart';
import '../../bloc/note_bloc/note_bloc.dart';
import 'bloc/bloc/barrel.dart';
import 'widgets/barrel.dart';

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
          return BlocProvider(
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
