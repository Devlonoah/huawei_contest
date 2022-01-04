import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huawei_contest/presentation/shared_widgets/bouncy_page_route.dart';

import '../../../../core/device_size.dart';
import '../../../../models/note_model.dart';
import '../../../../models/screen_arguments.dart';
import '../../../bloc/note_bloc/note_bloc.dart';
import '../../read/read.dart';

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
      Theme.of(context).inputDecorationTheme.copyWith(
          border: InputBorder.none,
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor);

  @override
  TextStyle? get searchFieldStyle =>
      Theme.of(context).textTheme.headline5?.copyWith(fontSize: 15.sp);

  @override
  String? get searchFieldLabel => 'Search note';

  @override
  Widget buildLeading(BuildContext context) {
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
                      onTap: () => Navigator.push(
                          context,
                          BouncyPageRoute(
                            widget: Read(),
                            arguments: ScreenArgument(
                                isNewNote: false, noteId: currentNote.id),
                          )));
                },
                separatorBuilder: (context, x) {
                  return Divider(color: Colors.white);
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
                    color: Colors.white,
                  );
                },
                itemCount: result.length),
          ),
        ],
      );
    });
  }
}
