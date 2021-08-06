import 'package:equatable/equatable.dart';

class EditEvent extends Equatable {
  final String title;
  final String note;
  const EditEvent(this.title, this.note);

  @override
  List<Object> get props => [title, note];
}
