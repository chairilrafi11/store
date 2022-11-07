
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/app/constant.dart';

part 'location_box.g.dart';

@HiveType(typeId: Constant.hiveType2)

class LocationBox {

  @HiveField(1)
  double? latitude;

  @HiveField(2)
  double? longitude;

  LocationBox({this.latitude, this.longitude});

  LocationBox.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
