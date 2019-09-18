import 'package:date_format/date_format.dart';

String dateToPTBR(DateTime dateTime) {
  return formatDate(dateTime, [dd, '/', mm, '/', yyyy]);
}
