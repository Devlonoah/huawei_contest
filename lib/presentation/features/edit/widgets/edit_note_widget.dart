import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/date_format.dart';
import '../../../../core/device_size.dart';
import '../../../../models/note_model.dart';
import '../../../../theme/colors.dart';
import '../../../bloc/note_bloc/note_bloc.dart';
import '../../../shared_widgets/text_input_widget.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final updatedNote = widget.note.copyWith(
      //       title: titleTextController.text,
      //       note: noteTextController.text,
      //     );

      //     BlocProvider.of<NoteBloc>(context)
      //       ..add(NoteUpdatedEvent(updatedNote));
      //     Navigator.pop(context);
      //   },
      //   child: Icon(Icons.save),
      // ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (titleTextController.text.length > 0 ||
                noteTextController.text.length > 0) {
              final updatedNote = widget.note.copyWith(
                  title: titleTextController.text,
                  note: noteTextController.text,
                  dateCreated: dateTimeToFormatDate(DateTime.now()));

              BlocProvider.of<NoteBloc>(context)
                ..add(NoteUpdatedEvent(updatedNote));
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }

            // if (titleTextController!.text.length > 0 ||
            //     noteTextController!.text.length > 0) {
            //   BlocProvider.of<NoteBloc>(context)
            //     ..add(
            //       NoteAddedEvent(
            //         NoteModel(
            //             title: titleTextController.text,
            //             note: noteTextController.text,
            //             label: '',
            //             dateCreated: dateTimeToFormatDate(DateTime.now())),
            //       ),
            //     );

            //   Navigator.pop(context);
            // }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.note.dateCreated.toString(),
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    SizedBox(width: 10),
                    Container(color: Colors.amber, width: 4, height: 14.0),
                  ],
                ),
                TextInputWidget(
                  autoFocus: true,
                  controller: titleTextController,
                  hint: 'Title',
                  isTitle: true,
                  onChanged: (x) {},
                ),
                TextInputWidget(
                  autoFocus: false,
                  controller: noteTextController,
                  hint: 'Start typing',
                  isTitle: false,
                  onChanged: (x) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
