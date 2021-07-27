part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoadInProgress extends NoteState {}

class NoteLoadingSuccess extends NoteState {
  final List<NoteModel> notes;

  NoteLoadingSuccess(this.notes);

  @override
  List<Object> get props => [notes];
}

class NoteDeletedSuccessful extends NoteState {}

class NoteLoadingFailure extends NoteState {
  final String? errorMessage;

  NoteLoadingFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage!];
}
