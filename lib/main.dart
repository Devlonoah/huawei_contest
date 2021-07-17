// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/add_edit.dart';
import 'package:huawei_contest/presentation/features/read/read.dart';
import 'package:huawei_contest/theme/colors.dart';

import 'bloc_observer.dart';
import 'core/device_size.dart';
import 'di/injection.dart' as di;
import 'di/injection.dart';
import 'presentation/features/home/home.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NoteBloc>(),
      child: MaterialApp(
        title: 'Nothy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          backgroundColor: Colors.blueGrey,
          scaffoldBackgroundColor: qqBlack,
          textTheme: TextTheme().apply(
              displayColor: Colors.black,
              bodyColor: Colors.black,
              decorationColor: Colors.black),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
              brightness: Brightness.dark,
              foregroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.purple.shade900,
            foregroundColor: Colors.white,
          ),
        ),
        home: Home(),
        routes: {
          Read.id: (context) => Read(),
          AddEdit.id: (context) => AddEdit(),
        },
      ),
    );
  }
}
