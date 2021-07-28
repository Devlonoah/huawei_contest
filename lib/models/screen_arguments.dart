import 'package:equatable/equatable.dart';

class ScreenArgument extends Equatable {
  final String? noteId;
  final bool isNewNote;

  ScreenArgument({
    this.noteId,
    required this.isNewNote,
  });

  @override
  List<Object?> get props => [
        noteId,
        isNewNote,
      ];
}
