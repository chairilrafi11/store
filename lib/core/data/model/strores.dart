
class Stores {
  String? storeId;
  String? storeCode;
  String? storeName;
  String? address;
  String? dcId;
  String? dcName;
  String? accountId;
  String? accountName;
  String? subchannelId;
  String? subchannelName;
  String? channelId;
  String? channelName;
  String? areaId;
  String? areaName;
  String? regionId;
  String? regionName;
  String? latitude;
  String? longitude;

  Stores(
      {this.storeId,
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
      this.longitude});

  Stores.fromJson(Map<String, dynamic> json) {
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
