import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game2048/presentation/models/game_mode_model.dart';

part 'board_args_model.freezed.dart';
part 'board_args_model.g.dart';

@freezed
abstract class BoardArgs with _$BoardArgs {
  @Assert("appBartitle != ''", 'Title must not be null')
  factory BoardArgs({required String appBartitle, required GameMode gameMode}) =
      _BoardArgs;

  factory BoardArgs.fromJson(Map<String, dynamic> json) =>
      _$BoardArgsFromJson(json);

  static final BoardArgs survivalDefaultArgs = BoardArgs(
    gameMode: GameMode.survival(undoAllowed: true, dimension: 4),
    appBartitle: 'Survival',
  );
  static final BoardArgs timeRecordDefaultArgs = BoardArgs(
    gameMode: GameMode.time(undoAllowed: true, dimension: 4),
    appBartitle: 'Time Record',
  );
}
