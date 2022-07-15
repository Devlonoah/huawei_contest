part of 'note_bloc.dart';

abstract class NoteState {
  const NoteState();
}

class NoteInitial extends NoteState {}

class NoteLoadInProgress extends NoteState {}

// ignore: must_be_immutable
class NoteLoadingSuccess extends NoteState {
  List<NoteModel> notes;

  NoteLoadingSuccess(this.notes);
}

class NoteDeletedSuccessful extends NoteState {}

class NoteLoadingFailure extends NoteState {
  final String? errorMessage;

  NoteLoadingFailure(this.errorMessage);
}
