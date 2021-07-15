import 'package:equatable/equatable.dart';

class AppFailure extends Equatable {
  final String? message;

  AppFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class StorageFailure extends AppFailure {
  static const String _messagex = 'Account Already Exist';
  final String? message;
  StorageFailure([this.message = _messagex]) : super(_messagex);

  @override
  List<Object?> get props => [message];
}

class DatabaseFailure extends AppFailure {
  static const String _messagex = "Error in Database";
  final String? message;
  DatabaseFailure([this.message = _messagex]) : super(_messagex);
}
