import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game2048/presentation/models/game_mode_enum.dart';

part 'game_mode_model.freezed.dart';
part 'game_mode_model.g.dart';

@Freezed()
abstract class GameMode with _$GameMode {
  @Assert(
    'dimension >= 4',
    'dimension must be greater than or equal to 4 -> (4x4)',
  )
  const factory GameMode({
    @Default(GameModeEnum.survivalMaxScore) GameModeEnum mode,
    @Default(true) bool undoAllowed,
    @Default(4) int dimension,
  }) = _GameMode;
  factory GameMode.fromJson(Map<String, Object?> json) =>
      _$GameModeFromJson(json);

  factory GameMode.survival({bool undoAllowed = true, int dimension = 4}) =>
      GameMode(
        mode: GameModeEnum.survivalMaxScore,
        undoAllowed: undoAllowed,
        dimension: dimension,
      );
  factory GameMode.time({bool undoAllowed = true, int dimension = 4}) =>
      GameMode(
        mode: GameModeEnum.timeRecord,
        undoAllowed: undoAllowed,
        dimension: dimension,
      );
  static final GameMode defaults = GameMode.survival(
    undoAllowed: true,
    dimension: 4,
  );
}

extension GameModeUtilsExtension on GameMode {
  int get squaredDim => dimension * dimension;
}
