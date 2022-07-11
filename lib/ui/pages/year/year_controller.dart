import 'package:intl/intl.dart';

class YearController {
  DateTime dateEndYear =
      DateTime(DateTime.now().year + 1).subtract(const Duration(seconds: 1));
  DateTime dateStartYear = DateTime(DateTime.now().year);

  String dateToday() {
    return DateFormat('dd/MM/yy ( EEEE )').format(DateTime.now());
  }

  int missingDaysEndYear() {
    return dateEndYear.difference(DateTime.now()).inDays + 1;
  }

  int beginningDaysStartYear() {
    return DateTime.now().difference(dateStartYear).inDays;
  }

  String percentagePassedYear() {
    return (beginningDaysStartYear() / 365 * 100).toStringAsFixed(2);
  }

  String percentageTheEndYear() {
    return (missingDaysEndYear() / 365 * 100).toStringAsFixed(2);
  }
}
