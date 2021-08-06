import 'package:intl/intl.dart';

String dateTimeToFormatDate(DateTime date) {
  DateFormat dtFormat = DateFormat('EEE, MMM d, h:mm a');

  var formattedDate = dtFormat.format(date);

  return formattedDate.toString();
}

String stringifiedDateToFormatDate(String date) {
  var _parsedDate = DateTime.parse(date).toString();

  DateFormat _dtFormat = DateFormat('EEE, MMM d, h:mm a');

  return _dtFormat.parse(_parsedDate).toString();
}
