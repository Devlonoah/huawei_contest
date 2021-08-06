import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/common/date_format.dart';

import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/models/note_model.dart';
import 'package:huawei_contest/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/bloc/bloc/barrel.dart';
import 'package:huawei_contest/presentation/features/edit/bloc/bloc/edit_bloc.dart';
import 'package:huawei_contest/presentation/features/edit/widgets/header_input.dart';
import 'package:huawei_contest/presentation/shared_widgets/text_input_widget.dart';

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
            context.read()<NoteBloc>(context)
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
                  SizedBox(height: DS.sh * 0.02),
                  DateCreated(),
                ],
              ),
            ),
            SizedBox(
              height: DS.sh * 0.02,
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
