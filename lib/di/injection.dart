import 'package:get_it/get_it.dart';
import '../dao/note_dao.dart';
import '../data/data_source/local_data_source.dart';
import '../data/repositories/note_repositories_impl.dart';
import '../data/repositories/theme_persist_repository.dart';
import '../presentation/bloc/note_bloc/note_bloc.dart';
import '../presentation/bloc/theme_bloc/barrel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//repository

  sl.registerLazySingleton<NoteRepository>(() => NoteRepository(sl()));

  //Bloc
  sl.registerFactory(
    () => NoteBloc(sl()),
  );

  sl.registerFactory(
    () => ThemeBloc(sl()),
  );

  sl.registerLazySingleton(() => ThemePersistRepositoryImpl(sl()));

//data-Source

  sl.registerLazySingleton(() => LocalDataSourceImpl(sl()));

//Dao--Data access object

  sl.registerLazySingleton(() => NoteDaoImpl());

//! External
// // // Database provider
// sl.registerLazySingleton(() => DatabaseProvider());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
