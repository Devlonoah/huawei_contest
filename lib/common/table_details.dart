import 'package:equatable/equatable.dart';

class TableDetails extends Equatable {
  static final String id = 'id';
  static final String title = 'title';
  static final String note = 'note';
  static final String label = 'label';
  static final String dateCreated = 'dateCreated';
  static final String tableName = 'NoteTable';

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, label, note, dateCreated, tableName];
}
