import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  ThemeChangedEvent(this.value);
  final bool value;
  @override
  List<Object> get props => [value];
}

class AppInitializedThemeEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}
