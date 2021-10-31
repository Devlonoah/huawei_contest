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
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleTextController!.text.length > 0 ||
              noteTextController!.text.length > 0) {
            BlocProvider.of<NoteBloc>(context)
              ..add(
                NoteAddedEvent(
                  NoteModel(
                      title: titleTextController?.text,
                      note: noteTextController?.text,
                      label: '',
                      dateCreated: dateTimeToFormatDate(DateTime.now())),
                ),
              );

            Navigator.pop(context);
          }
        },
        child: Icon(Icons.save),
      ),
      body: Container(
        height: DS.sh,
        width: DS.sw,
        padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.04),
        child: Column(
          children: [
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
                  DateCreated(),
                ],
              ),
            ),
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
    );
  }
}
