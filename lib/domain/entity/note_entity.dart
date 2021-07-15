import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final int? id;
  final String? title;
  final String? note;
  final String? label;
  final String? dateCreated;

  NoteEntity({
    this.id,
    this.title,
    this.note,
    this.label,
    this.dateCreated,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        label,
        dateCreated,
      ];
}
