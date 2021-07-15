// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';

import 'bloc_observer.dart';
import 'dao/note_dao.dart';
import 'di/di.dart' as di;

Future<void> main() async {
  await di.init();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => di.sl<NoteBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<NoteBloc>(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Test'),
              TextButton.icon(
                onPressed: () async {
                  // BlocProvider.of<NoteBloc>(context).add(NoteLoadedEvent());

                  // DatabaseProvider databaseProvider = DatabaseProvider();
                  NoteDaoImpl daoImpl = NoteDaoImpl();

                  // await daoImpl.addNote(note);
                  await daoImpl.dbAsses();

                  // var result = await daoImpl.addNote(note);

                  // print(result);
                },
                icon: Icon(Icons.touch_app),
                label: Text('Use Database'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
