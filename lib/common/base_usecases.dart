import 'package:dartz/dartz.dart';
import 'package:huawei_contest/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppFailure, Type>> call(Params params);
}
