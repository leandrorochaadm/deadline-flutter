import 'package:intl/intl.dart';

class LifeController {
  DateTime dateEndLife = DateTime(2058);
  DateTime dateStartLife = DateTime(1993, 8, 22, 23, 30);
  int days = 0;

  String dateEndLifeStr() {
    return DateFormat('dd/MM/yy').format(dateEndLife);
  }

  int missingDaysEndLife() {
    return dateEndLife.difference(DateTime.now()).inDays;
  }

  int beginningDaysStartLife() {
    return DateTime.now().difference(dateStartLife).inDays;
  }

  int daysLife() => dateEndLife.difference(dateStartLife).inDays;

  String percentagePassedLife() {
    return (beginningDaysStartLife() / daysLife() * 100).toStringAsFixed(3);
  }

  String percentageTheEndLife() {
    print(daysLife());
    return (missingDaysEndLife() / daysLife() * 100).toStringAsFixed(3);
  }

  String? validForm(String? value) {
    if (value == null || value.isEmpty) {
      days = 0;
      return "Data obrigatória";
    }
    DateTime dateValid;

    try {
      dateValid = DateFormat("dd/MM/yy").parse(value);
    } catch (_) {
      days = 0;
      return 'Data inválida';
    }

    if (DateTime.now().isBefore(dateValid.add(const Duration(days: 1)))) {
      days = 0;
      return 'Data deve ser menor que hoje';
    }

    days = DateTime.now().difference(dateValid).inDays;

    return null;
  }
}
