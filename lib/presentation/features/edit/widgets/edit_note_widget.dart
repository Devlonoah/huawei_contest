import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/models/note_model.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/shared_widgets/text_input_widget.dart';

class EditNoteWidget extends StatefulWidget {
  final NoteModel note;

  const EditNoteWidget({Key? key, required this.note}) : super(key: key);

  @override
  _EditNoteWidgetState createState() => _EditNoteWidgetState();
}

class _EditNoteWidgetState extends State<EditNoteWidget> {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();
  TextEditingController dateCreatedTextController = TextEditingController();

  TextEditingController labelTextController = TextEditingController();

  TextEditingController idTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleTextController.text = widget.note.title!;
    noteTextController.text = widget.note.note!;
    dateCreatedTextController.text = widget.note.dateCreated!;
    labelTextController.text = widget.note.label!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final updatedNote = widget.note.copyWith(
            title: titleTextController.text,
            note: noteTextController.text,
          );

          BlocProvider.of<NoteBloc>(context)
            ..add(NoteUpdatedEvent(updatedNote));
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text(
          'Edit note',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.04),
          child: Column(
            children: [
              TextInputWidget(
                  autoFocus: true,
                  controller: titleTextController,
                  hint: 'Add Title',
                  isTitle: true,
                  onChanged: (x) {}),
              SizedBox(height: DS.sh * 0.01),
              Expanded(
                child: TextInputWidget(
                  autoFocus: false,
                  controller: noteTextController,
                  hint: 'Add Note here...',
                  isTitle: false,
                  onChanged: (x) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
