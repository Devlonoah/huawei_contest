import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:huawei_contest/common/screen_arguments.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/models/note_model.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/add_edit.dart';
import 'package:huawei_contest/presentation/shared_widgets/opacity_animating_widget.dart';
import 'package:huawei_contest/presentation/shared_widgets/sliding_animating_widget.dart';

class Read extends StatelessWidget {
  static String id = 'Read';

  Read({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        ScreenArgument args =
            (ModalRoute.of(context)!.settings.arguments) as ScreenArgument;

        print('Argument passed is $args');
        final note = (state as NoteLoadingSuccess)
            .notes
            .firstWhere((e) => args.noteId?.trim() == e.id);

        print(note.id);
        return ReadBody(note: note);
      },
    );
  }
}

class ReadBody extends StatelessWidget {
  const ReadBody({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return note == null
        ? Center(
            child: Text('No note here'),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            appBar: AppBar(),
            body: Body(note: note),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Edit',
              onPressed: () => Navigator.pushNamed(
                context,
                AddEdit.id,
                arguments: ScreenArgument(isNewNote: false, noteId: note.id),
              ),
              child: Icon(Icons.edit),
            ),
          );
  }
}

class Body extends StatelessWidget {
  final NoteModel note;

  const Body({Key? key, required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpacityAnimatingWidget(
            widget: Text(note.title.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                note.dateCreated.toString(),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                    color: Colors.grey),
              ),
              SizedBox(width: DS.sw * 0.03),
              Container(color: Colors.grey, width: 3.0, height: 25.0),
              SizedBox(width: DS.sw * 0.03),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: DS.sw * 0.02, vertical: DS.sh * 0.007),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text('${note.note?.length} CHARACTERS ',
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontFamily: 'Monaco')),
                ),
              )
            ],
          ),
          SizedBox(height: DS.sh * 0.03),
          Expanded(
            child: ScaleAnimatingWidget(
              widget: Text(
                note.note.toString(),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).textTheme.headline1?.color,
                    fontFamily: 'Monaco'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Work on the constructor

