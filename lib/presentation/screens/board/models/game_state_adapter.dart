import 'package:game2048/presentation/screens/board/models/game_state_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GameStateAdapter extends TypeAdapter<GameState> {
  @override
  final typeId = 0;

  @override
  GameState read(BinaryReader reader) {
    return GameState.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, GameState obj) {
    writer.write(obj.toJson());
  }
}
