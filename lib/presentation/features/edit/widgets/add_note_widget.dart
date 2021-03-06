import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/date_format.dart';

import '../../../../core/device_size.dart';
import '../../../../models/note_model.dart';
import '../../../bloc/note_bloc/note_bloc.dart';
import '../bloc/bloc/barrel.dart';
import '../bloc/bloc/edit_bloc.dart';
import 'header_input.dart';
import '../../../shared_widgets/text_input_widget.dart';

class AddNoteWidget extends StatefulWidget {
  @override
  _AddNoteWidgetState createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends State<AddNoteWidget> {
  TextEditingController? titleTextController = TextEditingController();

  TextEditingController? noteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (titleTextController!.text.length > 0 ||
                noteTextController!.text.length > 0) {
              BlocProvider.of<NoteBloc>(context)
                ..add(
                  NoteAddedEvent(NoteModel(
                      title: titleTextController?.text,
                      note: noteTextController?.text,
                      label: '',
                      dateCreated: dateTimeToFormatDate(DateTime.now()))),
                );

              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            // padding: MediaQuery.of(context).viewInsets,
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: DateCreated()),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextInputWidget(
                        autoFocus: true,
                        controller: titleTextController,
                        hint: 'Add Title',
                        isTitle: true,
                        onChanged: (x) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<EditBloc, EditState>(
                    builder: (context, state) {
                      return TextInputWidget(
                        autoFocus: false,
                        controller: noteTextController,
                        isTitle: false,
                        onChanged: (x) {},
                        hint: 'Add Note here....',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
