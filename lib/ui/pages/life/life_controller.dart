class LifeController {
  DateTime dateEndLife = DateTime(2058);
  DateTime dateStartLife = DateTime(1993, 8, 22, 23, 30);

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
}
