// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationBoxAdapter extends TypeAdapter<LocationBox> {
  @override
  final int typeId = 2;

  @override
  LocationBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationBox(
      latitude: fields[1] as double?,
      longitude: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, LocationBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
