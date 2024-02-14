// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_caches_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageCacheModelAdapter extends TypeAdapter<LanguageCacheModel> {
  @override
  final int typeId = 108;

  @override
  LanguageCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageCacheModel(
      type: fields[0] == null ? 0 : fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageCacheModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
