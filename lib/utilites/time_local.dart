import 'package:intl/intl.dart';

class LocalTimeZone {
  static String formatDateTime(DateTime utcDateTime) {
    Duration timeZoneOffset = DateTime.now().timeZoneOffset;
    DateTime localDateTime = utcDateTime.add(timeZoneOffset);
    print("UTC           $utcDateTime");
    print("localDateTime $localDateTime");
    DateFormat formatter = DateFormat('HH:mm aa');
    return formatter.format(localDateTime);
  }
}
