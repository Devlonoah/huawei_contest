import 'package:flutter/material.dart';
import '../../../../common/date_format.dart';
import '../../../../core/device_size.dart';

class DateCreated extends StatelessWidget {
  const DateCreated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dateTimeToFormatDate(DateTime.now()),
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        SizedBox(width: 10),
        Container(
          color: Colors.amber,
          width: 4,
          height: 14.0,
        ),
      ],
    );
  }
}
