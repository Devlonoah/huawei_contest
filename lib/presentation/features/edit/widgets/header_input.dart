// import 'package:flutter/material.dart';
// import 'package:huawei_contest/core/device_size.dart';
// import 'package:huawei_contest/presentation/widgets/text_input_widget.dart';

// class HeaderInput extends StatelessWidget {
//   const HeaderInput({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextInputWidget(
//             hint: 'Add Title',
//             isTitle: true,
//             onChanged: (x) {},
//           ),
//           SizedBox(height: DS.sh * 0.02),
//           DateCreated(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:huawei_contest/common/date_format.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/theme/colors.dart';
import 'package:intl/intl.dart';

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
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w500,
                )),
        SizedBox(
          width: DS.sw * 0.03,
        ),
        Container(
          color: Colors.amber,
          width: DS.sw * 0.009,
          height: 25.0,
        ),
      ],
    );
  }
}
