import 'dart:convert';

import 'package:huawei_contest/domain/entity/note_entity.dart';

class NoteModel extends NoteEntity {
  final int? id;
  final String? title;
  final String? note;
  final String? label;
  final String dateCreated;

  NoteModel(
    this.id,
    this.title,
    this.note,
    this.label,
    this.dateCreated,
  ) : super(
          id: id,
          title: title,
          note: note,
          label: label,
          dateCreated: dateCreated,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '',
      'title': title ?? '',
      'note': note ?? '',
      'label': label ?? '',
      'dateCreated': dateCreated,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      map['id'] ?? '',
      map['title'] ?? '',
      map['note'] ?? '',
      map['label'] ?? '',
      map['dateCreated'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));
}
