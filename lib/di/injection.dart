import 'package:get_it/get_it.dart';
import 'package:huawei_contest/dao/note_dao.dart';
import 'package:huawei_contest/data/data_source/local_data_source.dart';
import 'package:huawei_contest/data/repositories/note_repositories_impl.dart';
import 'package:huawei_contest/domain/repositories/note_repository.dart';
import 'package:huawei_contest/domain/usecases/add_note_usecase.dart';
import 'package:huawei_contest/domain/usecases/fetch_all_notes_usecase.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';

final sl = GetIt.instance;

init() {
//repository

  sl.registerFactory<NoteRepository>(() => NoteRepositoryImpl(sl()));

  //Bloc
  sl.registerFactory(
      () => NoteBloc(addNoteUsecase: sl(), fetchAllNoteUsecase: sl()));
//UseCases

  sl.registerLazySingleton<FetchAllNoteUsecase>(
      () => FetchAllNoteUsecase(sl()));
  sl.registerLazySingleton<AddNoteUsecase>(() => AddNoteUsecase(sl()));

//data-Source

  sl.registerLazySingleton(() => LocalDataSourceImpl(sl()));

//Dao--Data access object

  sl.registerLazySingleton(() => NoteDaoImpl());

//! External
// // // Database provider
// sl.registerLazySingleton(() => DatabaseProvider());
}
