import 'package:dartz/dartz.dart';
import '../core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppFailure, Type>> call(Params params);
}
