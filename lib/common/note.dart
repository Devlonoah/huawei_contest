import 'dart:convert';

import 'package:huawei_contest/domain/entity/note_entity.dart';

class Note extends NoteEntity {
  final String? dateCreated;
  final int? id;
  final String? label;
  final String? note;
  final String? title;

  Note({
    this.dateCreated,
    this.id,
    this.label,
    this.note,
    this.title,
  }) : super(
          id: id,
          label: label,
          note: note,
          title: title,
          dateCreated: dateCreated,
        );

  Note copyWith({
    String? dateCreated,
    int? id,
    String? label,
    String? note,
    String? title,
  }) {
    return Note(
      dateCreated: dateCreated ?? this.dateCreated,
      id: id ?? this.id,
      label: label ?? this.label,
      note: note ?? this.note,
      title: title ?? this.title,
    );
  }

  // Uuid uuid = Uuid();
  Map<String, dynamic> toMap() {
    return {
      'dateCreated': this.dateCreated.toString(),
      'id': this.id ?? 0,
      'label': this.label,
      'note': this.note,
      'title': this.title,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      dateCreated: map['dateCreated'],
      id: map['id'],
      label: map['label'],
      note: map['note'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        dateCreated,
        label,
      ];
}
