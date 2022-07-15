part of 'note_bloc.dart';

abstract class NoteEvent {
  const NoteEvent();
}

class NoteLoadedEvent extends NoteEvent {}

class NoteDeletedEvent extends NoteEvent {
  final NoteModel noteEntity;

  NoteDeletedEvent(this.noteEntity);
}

class NoteAddedEvent extends NoteEvent {
  final NoteModel note;

  NoteAddedEvent(this.note);
}

class NoteUpdatedEvent extends NoteEvent {
  final NoteModel noteEntity;

  NoteUpdatedEvent(this.noteEntity);
}

class NoteDeletedAllEvent extends NoteEvent {
  final NoteModel noteEntity;

  NoteDeletedAllEvent(this.noteEntity);
}
