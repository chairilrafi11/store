import 'package:chairil/core/app/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'store_box.g.dart';

@HiveType(typeId: Constant.hiveType1)

class StoreBox {

  @HiveField(1)
  String? storeId;

  @HiveField(2)
  String? storeCode;

  @HiveField(3)
  String? storeName;

  @HiveField(4)
  String? address;

  @HiveField(5)
  String? dcId;

  @HiveField(6)
  String? dcName;

  @HiveField(7)
  String? accountId;

  @HiveField(8)
  String? accountName;

  @HiveField(9)
  String? subchannelId;

  @HiveField(10)
  String? subchannelName;

  @HiveField(11)
  String? channelId;

  @HiveField(12)
  String? channelName;

  @HiveField(13)
  String? areaId;

  @HiveField(14)
  String? areaName;

  @HiveField(15)
  String? regionId;

  @HiveField(16)
  String? regionName;

  @HiveField(17)
  String? latitude;

  @HiveField(18)
  String? longitude;

  @HiveField(19)
  String? lastVisit;

  StoreBox({
    this.storeId,
    this.storeCode,
    this.storeName,
    this.address,
    this.dcId,
    this.dcName,
    this.accountId,
    this.accountName,
    this.subchannelId,
    this.subchannelName,
    this.channelId,
    this.channelName,
    this.areaId,
    this.areaName,
    this.regionId,
    this.regionName,
    this.latitude,
    this.longitude,
    this.lastVisit
  });

  StoreBox.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeCode = json['store_code'];
    storeName = json['store_name'];
    address = json['address'];
    dcId = json['dc_id'];
    dcName = json['dc_name'];
    accountId = json['account_id'];
    accountName = json['account_name'];
    subchannelId = json['subchannel_id'];
    subchannelName = json['subchannel_name'];
    channelId = json['channel_id'];
    channelName = json['channel_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    regionId = json['region_id'];
    regionName = json['region_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['store_id'] = storeId;
    data['store_code'] = storeCode;
    data['store_name'] = storeName;
    data['address'] = address;
    data['dc_id'] = dcId;
    data['dc_name'] = dcName;
    data['account_id'] = accountId;
    data['account_name'] = accountName;
    data['subchannel_id'] = subchannelId;
    data['subchannel_name'] = subchannelName;
    data['channel_id'] = channelId;
    data['channel_name'] = channelName;
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['region_id'] = regionId;
    data['region_name'] = regionName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
