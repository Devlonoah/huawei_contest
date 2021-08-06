import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:huawei_contest/presentation/features/edit/bloc/bloc/barrel.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditState(false));

  @override
  Stream<EditState> mapEventToState(
    EditEvent event,
  ) async* {
    if (event is EditEvent) {
      var isValid = (event.note.length > 0 && event.title.length > 0);

      yield EditState(isValid);
    }
  }
}
