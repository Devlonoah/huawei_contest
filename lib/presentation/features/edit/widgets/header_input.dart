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
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15)),
        SizedBox(width: DS.sw * 0.01),
        Container(
          color: Colors.amber,
          width: DS.sw * 0.009,
          height: 25.0,
        ),
      ],
    );
  }
}
