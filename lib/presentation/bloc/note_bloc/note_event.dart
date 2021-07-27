part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class NoteLoadedEvent extends NoteEvent {}

class NoteDeletedEvent extends NoteEvent {
  final NoteModel noteEntity;

  NoteDeletedEvent(this.noteEntity);
  @override
  List<Object> get props => [noteEntity];
}

class NoteAddedEvent extends NoteEvent {
  final NoteModel note;

  NoteAddedEvent(this.note);
  @override
  List<Object> get props => [note];
}

class NoteUpdatedEvent extends NoteEvent {
  final NoteModel noteEntity;

  NoteUpdatedEvent(this.noteEntity);
  @override
  List<Object> get props => [noteEntity];
}

class NoteDeletedAllEvent extends NoteEvent {
  final NoteModel noteEntity;

  NoteDeletedAllEvent(this.noteEntity);
  @override
  List<Object> get props => [noteEntity];
}
