// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mode_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModeEnumAdapter extends TypeAdapter<GameModeEnum> {
  @override
  final int typeId = 3;

  @override
  GameModeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GameModeEnum.survivalMaxScore;
      case 1:
        return GameModeEnum.timeRecord;
      default:
        return GameModeEnum.survivalMaxScore;
    }
  }

  @override
  void write(BinaryWriter writer, GameModeEnum obj) {
    switch (obj) {
      case GameModeEnum.survivalMaxScore:
        writer.writeByte(0);
        break;
      case GameModeEnum.timeRecord:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
