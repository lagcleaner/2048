// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game2048/presentation/models/game_mode_model.dart';
import 'package:game2048/presentation/screens/board/models/game_status_enum.dart';
import 'package:game2048/presentation/screens/board/models/tile_model.dart';

export 'package:game2048/presentation/screens/board/models/game_status_enum.dart';

part 'game_state_model.freezed.dart';
part 'game_state_model.g.dart';

@freezed
abstract class GameState with _$GameState {
  factory GameState({
    required GameMode mode,
    @Default(<List<Tile>>[]) List<List<Tile>> board,
    @Default(0) int best,
    @Default(0) int score,
    @Default(GameStatus.stoped) GameStatus status,
    GameState? undo,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);

  factory GameState.newGame({
    required int best,
    required List<List<Tile>> board,
    required GameMode mode,
  }) => GameState(
    best: best,
    board: board,
    mode: mode,
    score: 0,
    status: GameStatus.stoped,
    undo: null,
  );
}

extension GameStateExtension on GameState {
  Iterable<Tile> get flattened => (this as _$GameState).board.expand((e) => e);
  List<List<Tile>> get tiles => (this as _$GameState).board;
  List<List<Tile>> get rows => (this as _$GameState).board;
  List<List<Tile>> get cols => List.generate(
    (this as _$GameState).board.length,
    (x) => List.generate(
      (this as _$GameState).board[0].length,
      (y) => (this as _$GameState).board[y][x],
    ),
  );

  Tile at(int row, int col) {
    return (this as _$GameState).board[row][col];
  }
}
