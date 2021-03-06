import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/repositories/theme_persist_repository.dart';
import 'barrel.dart';
import '../../../theme/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.themePersistRepositoryImpl)
      : super(ThemeState(themeData: lightThemeData(), currentValue: false));

  final ThemePersistRepositoryImpl themePersistRepositoryImpl;
  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChangedEvent) {
      if (event.value == true) {
        yield ThemeState(themeData: darkThemeData(), currentValue: event.value);
      } else {
        yield ThemeState(
            themeData: lightThemeData(), currentValue: event.value);
      }

      await _saveToDisk(event.value);
    }

    if (event is AppInitializedThemeEvent) {
      yield* _mapAppInitialized();
    }
  }

  Future<void> _saveToDisk(bool value) async {
    await themePersistRepositoryImpl.saveThemeState(value);
  }

  Stream<ThemeState> _mapAppInitialized() async* {
    var result = await themePersistRepositoryImpl.fetchThemeState();

    yield ThemeState(themeData: boolToThemeState(result), currentValue: result);
  }
}

ThemeData boolToThemeState(bool value) {
  if (value == true) {
    return darkThemeData();
  }
  return lightThemeData();
}
