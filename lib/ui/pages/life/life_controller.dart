import 'package:intl/intl.dart';

class LifeController {
  DateTime dateEndLife = DateTime(2058, 4, 28);
  DateTime dateStartLife = DateTime(1993, 8, 22);

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
    return (missingDaysEndLife() / daysLife() * 100).toStringAsFixed(3);
  }

  String daysToFormated(int days) {
    final y = (days / 365.25).floor();
    final yd = (y * 365.25);
    final m = ((days - yd) / 30).floor();
    final md = m * 30;
    final d = (days - yd - md).floor();
    return '$y anos \n$m meses \n$d dias';
  }

  String missingStringEndLife() => daysToFormated(missingDaysEndLife());
  String beginningStringStartLife() => daysToFormated(beginningDaysStartLife());

  String? validForm(String? value) {
    if (value == null || value.isEmpty || value.length < 10) {
      dateStartLife = DateTime.now();
      return "Data obrigatória";
    }

    try {
      dateStartLife = DateFormat("dd/MM/yyyy").parseStrict(value, true);
    } catch (_) {
      dateStartLife = DateTime.now();
      return 'Data inválida';
    }

    if (DateTime.now().isBefore(dateStartLife.add(const Duration(days: 1)))) {
      dateStartLife = DateTime.now();
      return 'Data deve ser menor que hoje';
    }

    return null;
  }
}
