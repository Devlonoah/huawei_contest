import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:huawei_contest/data/repositories/note_repositories_impl.dart';
import 'package:huawei_contest/models/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc(this.repository) : super(NoteInitial());

  final NoteRepository repository;
  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is NoteLoadedEvent) {
      yield* _mapNoteLoadedEventToState();
    }

    if (event is NoteAddedEvent) {
      yield* _mapNoteAddedEventToState(event);
    }

    if (event is NoteDeletedEvent) {
      yield* _mapNoteDeletedEventToState(event);
    }

    if (event is NoteUpdatedEvent) {
      yield* _mapNoteUpdatedEventToState(event);
    }
  }

  Stream<NoteState> _mapNoteUpdatedEventToState(NoteUpdatedEvent event) async* {
    var oldNotes = (state as NoteLoadingSuccess).notes;

    var updatedNote = oldNotes
        .map((e) => e.id == event.noteEntity.id ? event.noteEntity : e)
        .toList();

    yield* _updateDb(event.noteEntity, updatedNote);
  }

  Stream<NoteState> _updateDb(NoteModel note, List<NoteModel> notes) async* {
    var result = await repository.updateNote(note);

    yield* result.fold((l) async* {
      yield NoteLoadingFailure('Databasa palavar');
    }, (r) async* {
      yield NoteLoadingSuccess(notes);
    });
  }

  Stream<NoteState> _mapNoteDeletedEventToState(NoteDeletedEvent event) async* {
    if (state is NoteLoadingSuccess) {
      final updatedNote = (state as NoteLoadingSuccess)
          .notes
          .where((note) => note.id != event.noteEntity.id)
          .toList();

      yield NoteLoadingSuccess(updatedNote);
      await _deleteFromDb(event.noteEntity);
    }
  }

  Future<void> _deleteFromDb(NoteModel note) async {
    await repository.deleteNote(note);
  }

  Stream<NoteState> _mapNoteLoadedEventToState() async* {
    var result = await repository.fetchAllNote();

    yield* result.fold(
      (l) async* {
        yield NoteLoadingFailure(l.message);
      },
      (r) async* {
        if (r.isEmpty) {
          List<NoteModel> note = [];

          yield NoteLoadingSuccess(note);
        } else {
          yield NoteLoadingSuccess(r);
        }
      },
    );
  }

  Stream<NoteState> _mapNoteAddedEventToState(NoteAddedEvent event) async* {
    var oldNotes = (state as NoteLoadingSuccess).notes;
    oldNotes.insert(0, event.note);
    List<NoteModel> updatedNote = oldNotes;

    yield* _addNoteToDb(event, updatedNote);
  }

  Stream<NoteState> _addNoteToDb(
      NoteAddedEvent event, List<NoteModel> updatedNote) async* {
    var result = await repository.addNote(event.note);
    result.fold(
      (l) async* {
        yield NoteLoadingFailure(l.message);
      },
      (r) async* {
        yield NoteLoadingSuccess(updatedNote);
      },
    );
  }
}
