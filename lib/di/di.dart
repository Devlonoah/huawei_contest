import 'package:get_it/get_it.dart';
import 'package:huawei_contest/dao/note_dao.dart';
import 'package:huawei_contest/data/data_source/local_data_source.dart';
import 'package:huawei_contest/data/repositories/note_repositories_impl.dart';
import 'package:huawei_contest/database/database.dart';
import 'package:huawei_contest/domain/repositories/note_repository.dart';
import 'package:huawei_contest/domain/usecases/add_note_usecase.dart';
import 'package:huawei_contest/domain/usecases/fetch_all_notes_usecase.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:sqflite/sqflite.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => NoteBloc(sl(), sl()));
//Usecases
  sl.registerLazySingleton(() => FetchAllNoteUsecase(sl()));
  sl.registerLazySingleton(() => AddNoteUsecase(sl()));
//repository

  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));

  //Dao--Data access object

  sl.registerLazySingleton<NoteDao>(() => NoteDaoImpl());

  //data-Source

  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));

  //! External
  // // Database provider
  DatabaseProvider databaseProvider = DatabaseProvider();
  sl.registerLazySingleton<DatabaseProvider>(() => databaseProvider);
}
