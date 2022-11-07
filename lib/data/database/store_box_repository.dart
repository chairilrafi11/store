import 'package:chairil/core/app/constant.dart';
import 'package:chairil/core/database/core_database.dart';
import 'package:chairil/data/database/store_box.dart';

class StoreBoxRepository {

  static Future save(List<StoreBox> storeBox) async {
    await CoreDatabase.openBoxDatabase(Constant.storeBox).then((box) async {
      await box.addAll(storeBox);
    });
  }
    
  static Future update(int index, StoreBox storeBox) async {
    await CoreDatabase.openBoxDatabase(Constant.storeBox).then((box) async {
      await box.putAt(index, storeBox);
    });
  }

  static Future<List<StoreBox>> load() async {
    List<StoreBox> list = [];
    await CoreDatabase.openBoxDatabase(Constant.storeBox).then((store) {
      for (var element in store.values) {
        list.add(element);
      }
    });
    return list;
  }

  static Future clear() async {
    await CoreDatabase.openBoxDatabase(Constant.storeBox).then((box) async {
      await box.clear();
    });
  }

  static Future<bool?> isEmpty() async {
    var box = await CoreDatabase.openBoxDatabase(Constant.storeBox);
    return box.isEmpty;
  }
}