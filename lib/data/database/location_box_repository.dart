import 'package:chairil/core/app/constant.dart';
import 'package:chairil/core/database/core_database.dart';

import 'location_box.dart';

class LocationBoxRepository {

  static Future save(LocationBox locationBox) async {
    await CoreDatabase.openBoxDatabase(Constant.locationBox).then((box) async {
      await box.clear();
      await box.add(locationBox);
    });
  }
    
  static Future update(int index, LocationBox locationBox) async {
    await CoreDatabase.openBoxDatabase(Constant.locationBox).then((box) async {
      await box.putAt(index, locationBox);
    });
  }

  static Future<LocationBox> load() async {
    var box = await CoreDatabase.openBoxDatabase(Constant.locationBox);
    return box.values.first;
  }

  static Future clear() async {
    await CoreDatabase.openBoxDatabase(Constant.locationBox).then((box) async {
      await box.clear();
    });
  }

  static Future<bool?> isEmpty() async {
    var box = await CoreDatabase.openBoxDatabase(Constant.locationBox);
    return box.isEmpty;
  }
}