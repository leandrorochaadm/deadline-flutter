import 'package:intl/intl.dart';

class QuarterController {
  late final DateTime dateStartQuarter;
  late final DateTime dateEndQuarter;
  late final int daysQuarter;

  init() {
    final year = DateTime.now().year;
    switch (quarterToday()) {
      case 'Q1':
        dateStartQuarter = DateTime(year, 1, 1);
        dateEndQuarter = DateTime(year, 3, 30);
        daysQuarter = dateEndQuarter.difference(dateStartQuarter).inDays;
        break;
      case 'Q2':
        dateStartQuarter = DateTime(year, 4, 1);
        dateEndQuarter = DateTime(year, 6, 30);
        daysQuarter = dateEndQuarter.difference(dateStartQuarter).inDays;
        break;
      case 'Q3':
        dateStartQuarter = DateTime(year, 7, 1);
        dateEndQuarter = DateTime(year, 9, 30);
        daysQuarter = dateEndQuarter.difference(dateStartQuarter).inDays;
        break;
      case 'Q4':
        dateStartQuarter = DateTime(year, 10, 1);
        dateEndQuarter = DateTime(year, 12, 31);
        daysQuarter = dateEndQuarter.difference(dateStartQuarter).inDays;
        break;
    }
  }

  String dateToday() {
    return DateFormat('dd/MM/yy EEEE QQQ').format(DateTime.now().toLocal());
  }

  String quarterToday() {
    return DateFormat('QQQ').format(DateTime.now().toLocal());
  }

  int beginningWeeksStartQuarter() {
    return beginningDaysStartQuarter() ~/ 7;
  }

  int missingWeeksEndQuarter() {
    return (13 - beginningWeeksStartQuarter());
  }

  int missingDaysEndQuarter() {
    return dateEndQuarter.difference(DateTime.now()).inDays;
  }

  int beginningDaysStartQuarter() {
    return DateTime.now().difference(dateStartQuarter).inDays + 1;
  }

  String percentagePassedQuarter() {
    return (beginningDaysStartQuarter() / daysQuarter * 100).toStringAsFixed(2);
  }

  String percentageTheEndQuarter() {
    return (missingDaysEndQuarter() / daysQuarter * 100).toStringAsFixed(2);
  }
}
