import 'package:intl/intl.dart';

class YearController {
  DateTime dateEndYear = DateTime(DateTime.now().year + 1);
  DateTime dateStartYear = DateTime(DateTime.now().year);

  String dateToday() {
    return DateFormat('dd/MM/yy EEEE QQQ').format(DateTime.now().toLocal());
  }

  int beginningWeeksStartYear() {
    return beginningDaysStartYear() ~/ 7;
  }

  int missingWeeksEndYear() {
    return (52 - beginningWeeksStartYear());
  }

  int missingDaysEndYear() {
    return dateEndYear.difference(DateTime.now()).inDays;
  }

  int beginningDaysStartYear() {
    return DateTime.now().difference(dateStartYear).inDays + 1;
  }

  String percentagePassedYear() {
    return (beginningDaysStartYear() / 365 * 100).toStringAsFixed(2);
  }

  String percentageTheEndYear() {
    return (missingDaysEndYear() / 365 * 100).toStringAsFixed(2);
  }
}
