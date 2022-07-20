import 'item_date_model.dart';

class RegisterController {
  late List<ItemDate> listRegister;

  init() {
    listRegister = <ItemDate>[ItemDate(date: DateTime.now(), diff: 0)];
  }

  ItemDate calc(DateTime now, DateTime previus) {
    final diff = now.difference(previus).inSeconds;
    return ItemDate(date: now, diff: diff);
  }
}
