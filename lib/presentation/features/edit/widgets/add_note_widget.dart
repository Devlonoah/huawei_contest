import 'package:flutter/material.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/presentation/features/edit/widgets/header_input.dart';

class AddNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderInput(),
        SizedBox(
          height: DS.sh * 0.02,
        ),
        Expanded(
          child: TextField(
            maxLength: 1000,
            maxLines: 1000,
          ),
        ),
      ],
    );
  }
}
