import 'package:hive/hive.dart';

part 'game_mode_enum.g.dart';

@HiveType(typeId: 3)
enum GameModeEnum {
  @HiveField(0)
  survivalMaxScore,
  @HiveField(1)
  timeRecord,
}
