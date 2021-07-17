import 'package:flutter/material.dart';
import 'package:huawei_contest/domain/entity/note_entity.dart';

class EditNoteWidget extends StatefulWidget {
  final NoteEntity note;

  const EditNoteWidget({Key? key, required this.note}) : super(key: key);

  @override
  _EditNoteWidgetState createState() => _EditNoteWidgetState();
}

class _EditNoteWidgetState extends State<EditNoteWidget> {
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController dateCreated = TextEditingController();

  TextEditingController label = TextEditingController();

  TextEditingController id = TextEditingController();

  @override
  void initState() {
    super.initState();

    title.text = widget.note.title!;
    note.text = widget.note.note!;
    dateCreated.text = widget.note.dateCreated!;
    label.text = widget.note.label!;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(

        //
        );
  }
}
