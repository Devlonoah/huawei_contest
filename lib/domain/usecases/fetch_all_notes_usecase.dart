import 'package:dartz/dartz.dart';
import 'package:huawei_contest/common/base_usecases.dart';
import 'package:huawei_contest/core/error/failures.dart';
import 'package:huawei_contest/domain/entity/no_params.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';
import 'package:huawei_contest/domain/repositories/note_repository.dart';

class FetchAllNoteUsecase extends UseCase<List<NoteEntity>, NoParams> {
  final NoteRepository repository;

  FetchAllNoteUsecase(this.repository);
  @override
  Future<Either<AppFailure, List<NoteEntity>>> call(NoParams params) async {
    return await repository.fetchAllNote();
  }
}
