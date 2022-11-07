// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreBoxAdapter extends TypeAdapter<StoreBox> {
  @override
  final int typeId = 1;

  @override
  StoreBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreBox(
      storeId: fields[1] as String?,
      storeCode: fields[2] as String?,
      storeName: fields[3] as String?,
      address: fields[4] as String?,
      dcId: fields[5] as String?,
      dcName: fields[6] as String?,
      accountId: fields[7] as String?,
      accountName: fields[8] as String?,
      subchannelId: fields[9] as String?,
      subchannelName: fields[10] as String?,
      channelId: fields[11] as String?,
      channelName: fields[12] as String?,
      areaId: fields[13] as String?,
      areaName: fields[14] as String?,
      regionId: fields[15] as String?,
      regionName: fields[16] as String?,
      latitude: fields[17] as String?,
      longitude: fields[18] as String?,
      lastVisit: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreBox obj) {
    writer
      ..writeByte(19)
      ..writeByte(1)
      ..write(obj.storeId)
      ..writeByte(2)
      ..write(obj.storeCode)
      ..writeByte(3)
      ..write(obj.storeName)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.dcId)
      ..writeByte(6)
      ..write(obj.dcName)
      ..writeByte(7)
      ..write(obj.accountId)
      ..writeByte(8)
      ..write(obj.accountName)
      ..writeByte(9)
      ..write(obj.subchannelId)
      ..writeByte(10)
      ..write(obj.subchannelName)
      ..writeByte(11)
      ..write(obj.channelId)
      ..writeByte(12)
      ..write(obj.channelName)
      ..writeByte(13)
      ..write(obj.areaId)
      ..writeByte(14)
      ..write(obj.areaName)
      ..writeByte(15)
      ..write(obj.regionId)
      ..writeByte(16)
      ..write(obj.regionName)
      ..writeByte(17)
      ..write(obj.latitude)
      ..writeByte(18)
      ..write(obj.longitude)
      ..writeByte(19)
      ..write(obj.lastVisit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
