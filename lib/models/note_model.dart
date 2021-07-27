import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class NoteModel extends Equatable {
  final String? id;
  final String? title;
  final String? note;
  final String? label;
  final String? dateCreated;

  NoteModel({
    final String? id,
    this.title,
    this.note,
    this.label,
    this.dateCreated,
  }) : id = id ?? const Uuid().v4();

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
      id: map['id']?.toString() ?? '',
      title: map['title'] ?? '',
      note: map['note'] ?? '',
      label: map['label'] ?? '',
      dateCreated: map['dateCreated'],
    );
  }
// <=DateTime <=String
  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        title,
        dateCreated,
        note,
        label,
      ];

  NoteModel copyWith({
    String? id,
    String? title,
    String? note,
    String? label,
    String? dateCreated,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      label: label ?? this.label,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }
}
