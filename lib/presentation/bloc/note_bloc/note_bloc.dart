import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:huawei_contest/common/note.dart';
import 'package:huawei_contest/domain/entity/no_params.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';
import 'package:huawei_contest/domain/usecases/add_note_usecase.dart';
import 'package:huawei_contest/domain/usecases/fetch_all_notes_usecase.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({
    required this.fetchAllNoteUsecase,
    required this.addNoteUsecase,
  }) : super(NoteInitial());

  final FetchAllNoteUsecase fetchAllNoteUsecase;
  final AddNoteUsecase addNoteUsecase;

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
  }

  Stream<NoteState> _mapNoteLoadedEventToState() async* {
    var result = await fetchAllNoteUsecase.call(NoParams());

    yield* result.fold(
      (l) async* {
        yield NoteLoadingFailure(l.message);
      },
      (r) async* {
        print(r.length);
        if (r.isEmpty) {
          List<NoteEntity> note = [];

          yield NoteLoadingSuccess(note);
        } else {
          yield NoteLoadingSuccess(r);
        }
      },
    );
  }

  // Stream<NoteState> _mapNoteDeletedEventToState(NoteDeletedEvent event) async* {
  //   var oldNotes = (state as NoteLoadingSuccess).notes;

  //   var note = oldNotes.where((e) => e.id != event.noteEntity.id);

  // }

  Stream<NoteState> _mapNoteAddedEventToState(NoteAddedEvent event) async* {
    var oldNotes = (state as NoteLoadingSuccess).notes;

    List<NoteEntity> updatedNote =
        (oldNotes.add(event.note)) as List<NoteEntity>;

    yield* _addNote(event, updatedNote);

    yield NoteLoadingSuccess(updatedNote);
  }

  _addNote(NoteAddedEvent event, List<NoteEntity> updatedNote) async* {
    var result = await addNoteUsecase.call(event.note);
    result.fold((l) async* {
      yield NoteLoadingFailure(l.message);
    }, (r) async* {
      yield NoteLoadingSuccess(updatedNote);
    });
  }
}

NoteEntity noteToEntity(NoteEntity entity) {
  return NoteEntity(
    id: entity.id,
    title: entity.title,
    note: entity.note,
    label: entity.label,
    dateCreated: entity.dateCreated,
  );
}
