// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/bloc/theme_bloc/barrel.dart';
import 'package:huawei_contest/core/custom_routes.dart';

import 'bloc_observer.dart';
import 'di/injection.dart' as di;
import 'di/injection.dart';
import 'presentation/features/home/home.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NoteBloc>(),
        ),
        BlocProvider(
            create: (context) =>
                sl<ThemeBloc>()..add(AppInitializedThemeEvent()))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Nothy',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: Home(),
            routes: customRoutes,
          );
        },
      ),
    );
  }
}
