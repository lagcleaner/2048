import 'package:game2048/presentation/models/game_mode_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GameModeAdapter extends TypeAdapter<GameMode> {
  @override
  final typeId = 1;

  @override
  GameMode read(BinaryReader reader) {
    return GameMode.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, GameMode obj) {
    writer.write(obj.toJson());
  }
}
