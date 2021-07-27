import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:huawei_contest/common/screen_arguments.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/models/note_model.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/read/read.dart';

class MySearchDelegate extends SearchDelegate {
  final BuildContext context;
  final List<NoteModel> notes;
  MySearchDelegate({
    required this.context,
    required this.notes,
  });
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(Icons.cancel),
      ),
    ];
  }

  @override
  InputDecorationTheme? get searchFieldDecorationTheme =>
      Theme.of(context).inputDecorationTheme.copyWith();

  @override
  TextStyle? get searchFieldStyle => Theme.of(context).textTheme.headline5;

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search note';

  @override
  Widget buildLeading(BuildContext context) {
    // print(notes.length);
    print("query is $query");
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var result = notes
        .where((e) =>
            e.title!.contains(query.trim()) || e.note!.contains(query.trim()))
        .toList();

    if (result.length == 0) {
      return Center(
          child: Text('no filter', style: TextStyle(color: Colors.white)));
    } else {
      return Column(
        children: [
          SizedBox(
            height: DS.sh * 0.02,
          ),
          Text('Result'),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final currentNote = result[index];
                  return ListTile(
                    tileColor: Theme.of(context).cardColor,
                    title: Text(currentNote.title!),
                    onTap: () => Navigator.pushNamed(
                      context,
                      Read.id,
                      arguments: ScreenArgument(
                          isNewNote: false, noteId: currentNote.id),
                    ),
                  );
                },
                separatorBuilder: (context, x) {
                  return Divider(color: Colors.green);
                },
                itemCount: result.length),
          ),
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
      List<NoteModel> note = state is NoteLoadInProgress
          ? []
          : (state as NoteLoadingSuccess).notes;

      var result = note
          .where((e) => e.title!
              .toLowerCase()
              .trim()
              .contains(query.toLowerCase().trim()))
          .toList();

      return Column(
        children: [
          SizedBox(
            height: DS.sh * 0.02,
          ),
          Text('Suggestion'),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, x) {
                  var currentNote = result[x];
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Read.id,
                        arguments: ScreenArgument(
                            isNewNote: false, noteId: currentNote.id),
                      );
                    },
                    title: Text(
                      '${currentNote.title}',
                      style: TextStyle(fontFamily: 'Monaco'),
                    ),
                    subtitle: Text(
                      "${currentNote.note}",
                      style: TextStyle(fontFamily: 'Monaco'),
                    ),
                  );
                },
                separatorBuilder: (context, x) {
                  return Divider(
                    color: Colors.green,
                  );
                },
                itemCount: result.length),
          ),
        ],
      );
      // return ListView(
      //     children: result
      //         .map((e) =>
      //             ListTile(tileColor: Colors.white, title: Text(e.title!)))
      //         .toList());
    });
    // return ListView(children: [
    //   ListTile(
    //     title: Text(query),
    //   ),
    // ]);
  }
}
