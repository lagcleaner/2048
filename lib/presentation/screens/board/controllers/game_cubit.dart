import 'dart:developer';
import 'dart:math' show Random, max, min;

import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:game2048/core/error_handling/result.dart';
import 'package:game2048/data/services/game_storage_services.dart';
import 'package:game2048/presentation/models/game_mode_model.dart';
import 'package:game2048/presentation/screens/board/controllers/next_direction_cubit.dart';
import 'package:game2048/presentation/screens/board/controllers/round_cubit.dart';
import 'package:game2048/presentation/screens/board/models/game_state_model.dart';
import 'package:game2048/presentation/screens/board/models/tile_model.dart';
import 'package:riverbloc/riverbloc.dart';
import 'package:uuid/uuid.dart';

class GameCubit extends Cubit<GameState> {
  final RoundCubit round;
  final NextDirectionCubit nextDirection;
  final GameStorageServices storageServices;

  GameCubit(
    this.round,
    this.nextDirection,
    this.storageServices, [
    GameState? state,
  ]) : super(
         state ??
             GameState.newGame(best: 0, tiles: [], mode: GameMode.survival()),
       ) {
    //Load the last saved state or start a new game.
    load();
  }
  void load([GameMode? currentMode]) async {
    log("------------ Loading Game ----------------");
    final result = await storageServices.loadGame(
      key: currentMode?.toString() ?? 'default',
    );
    final stateToEmit = switch (result) {
      Success(value: final gameState) => gameState ?? state,
      Failure(exception: final _) => state,
    };
    if (result.isSuccess) {
      log("------------ Loaded Game ----------------");
    }
    emit(stateToEmit);
  }

  // We will use this list to retrieve the right index when user swipes up/down
  // which will allow us to reuse most of the logic.
  int get dim => state.mode.dimension;

  void newGame([GameMode? mode]) {
    emit(_newGame(mode));
  }

  bool move(SwipeDirection direction) {
    bool asc =
        direction == SwipeDirection.left || direction == SwipeDirection.up;
    bool vert =
        direction == SwipeDirection.up || direction == SwipeDirection.down;
    // Sort the list of tiles by index.
    // If user swipes vertically use the verticalOrder list to retrieve the up/down index
    final sorted =
        state.tiles.toList()..sort(
          ((a, b) =>
              (asc ? 1 : -1) *
              (vert
                  ? verticalOrder(a.index).compareTo(verticalOrder(b.index))
                  : a.index.compareTo(b.index))),
        );

    List<Tile> tiles = [];

    for (int i = 0, l = state.tiles.length; i < l; i++) {
      var tile = sorted[i];

      // Calculate nextIndex for current tile.
      tile = _calculate(tile, tiles, direction);
      tiles.add(tile);

      if (i + 1 < l) {
        var next = sorted[i + 1];
        // Assign current tile nextIndex or index to the next tile if its allowed to be moved.
        if (tile.value == next.value) {
          // If user swipes vertically use the verticalOrder list to retrieve the up/down index else use the existing index
          var index = vert ? verticalOrder(tile.index) : tile.index,
              nextIndex = vert ? verticalOrder(next.index) : next.index;
          if (_inSameRowOrCol(index, nextIndex)) {
            tiles.add(next.copyWith(nextIndex: tile.nextIndex));
            // Skip next iteration if next tile was already assigned nextIndex.
            i += 1;
            continue;
          }
        }
      }
    }

    // Assign immutable copy of the new board state and trigger rebuild.
    emit(state.copyWith(tiles: tiles, undo: state));
    return true;
  }

  /// Generates tiles at random place on the board
  Iterable<Tile> random(List<int> indexes, {int count = 1}) sync* {
    var i = 0;
    var rng = Random();
    var filledIndexes = indexes.toList();
    count = max(min(indexes.length, count), 1);
    while (count > 0 && filledIndexes.length < state.mode.squaredDim) {
      i = rng.nextInt(state.mode.squaredDim);
      if (filledIndexes.contains(i)) continue;
      yield Tile(index: i, value: 2, id: Uuid().v4());
      filledIndexes.add(i);
      count--;
    }
    return;
  }

  /// Merge tiles
  void merge() {
    List<Tile> tiles = [];
    var tilesMoved = false;
    List<int> indexes = [];
    var score = state.score;

    for (int i = 0, l = state.tiles.length; i < l; i++) {
      var tile = state.tiles[i];

      var value = tile.value, merged = false;

      if (i + 1 < l) {
        //sum the number of the two tiles with same index and mark the tile as merged and skip the next iteration.
        var next = state.tiles[i + 1];
        if (tile.nextIndex == next.nextIndex ||
            tile.index == next.nextIndex && tile.nextIndex == null) {
          value = tile.value + next.value;
          merged = true;
          score += tile.value;
          i += 1;
        }
      }

      if (merged || tile.nextIndex != null && tile.index != tile.nextIndex) {
        tilesMoved = true;
      }

      tiles.add(
        tile.copyWith(
          index: tile.nextIndex ?? tile.index,
          nextIndex: null,
          value: value,
          merged: merged,
        ),
      );
      indexes.add(tiles.last.index);
    }

    //If tiles got moved then generate a new tile at random position of the available positions on the board.
    if (tilesMoved) {
      tiles.addAll(random(indexes));
    }
    emit(
      state.copyWith(score: score, best: max(state.best, score), tiles: tiles),
    );
  }

  //Finish round, win or loose the game.
  void _endRound() {
    var gameOver = true, gameWon = false;
    List<Tile> tiles = [];

    //If there is no more empty place on the board
    if (state.tiles.length == state.mode.squaredDim) {
      final sorted =
          state.tiles.toList()..sort(((a, b) => a.index.compareTo(b.index)));

      for (int i = 0, l = state.tiles.length; i < l; i++) {
        var tile = sorted[i];

        //If there is a tile with 2048 then the game is won.
        if (tile.value == 2048) {
          gameWon = true;
        }

        var x = (i - (((i + 1) / dim).ceil() * dim - dim));

        if (x > 0 && i - 1 >= 0) {
          //If tile can be merged with left tile then game is not lost.
          var left = sorted[i - 1];
          if (tile.value == left.value) {
            gameOver = false;
          }
        }

        if (x < (dim - 1) && i + 1 < l) {
          //If tile can be merged with right tile then game is not lost.
          var right = sorted[i + 1];
          if (tile.value == right.value) {
            gameOver = false;
          }
        }

        if (i - dim >= 0) {
          //If tile can be merged with above tile then game is not lost.
          var top = sorted[i - dim];
          if (tile.value == top.value) {
            gameOver = false;
          }
        }

        if (i + dim < l) {
          //If tile can be merged with the bellow tile then game is not lost.
          var bottom = sorted[i + dim];
          if (tile.value == bottom.value) {
            gameOver = false;
          }
        }
        //Set the tile merged: false
        tiles.add(tile.copyWith(merged: false));
      }
    } else {
      //There is still a place on the board to add a tile so the game is not lost.
      gameOver = false;
      for (var tile in state.tiles) {
        //If there is a tile with 2048 then the game is won.
        if (tile.value == 2048) {
          gameWon = true;
        }
        //Set the tile merged: false
        tiles.add(tile.copyWith(merged: false));
      }
    }

    emit(
      state.copyWith(
        tiles: tiles,
        status: switch ((gameWon, gameOver)) {
          (_, true) => GameStatus.over,
          (true, _) => GameStatus.won,
          _ => GameStatus.playing,
        },
      ),
    );
  }

  //Mark the merged as false after the merge animation is complete.
  bool endRound() {
    //End round.
    _endRound();
    round.end();

    //If player moved too fast before the current animation/transition finished, start the move for the next direction
    var nextDirectionMove = nextDirection.state;
    if (nextDirectionMove != null) {
      move(nextDirectionMove);
      nextDirection.clear();
      return true;
    }
    return false;
  }

  //undo one round only
  void undo() {
    if (state.undo != null) {
      emit(
        state.copyWith(
          score: state.undo!.score,
          best: state.undo!.best,
          tiles: state.undo!.tiles,
        ),
      );
    }
  }

  int verticalOrder(int index) {
    // dim 5 -> [20, 15, 10, 5, 0, 21, 16, 11, 6, 1, 22, 17, 12, 7, 2, 23, 18, 13, 8, 3, 24, 19, 14, 9, 4]
    // dim 4 -> [12, 8, 4, 0, 13, 9, 5, 1, 14, 10, 6, 2, 15, 11, 7, 3];
    // dim 3 -> [6, 3, 0, 7, 4, 1, 8, 5, 2];
    return (dim - 1 - (index % dim)) * dim + (index ~/ dim);
  }

  int verticalOrderIndexOf(int value) {
    return (value % dim) * dim + (dim - 1 - (value ~/ dim));
  }

  GameState _newGame([GameMode? mode]) {
    return GameState.newGame(
      best: max(state.best, state.score),
      tiles: [...random([], count: 2)],
      mode: state.mode,
    );
  }

  Tile _calculate(Tile tile, List<Tile> tiles, SwipeDirection direction) {
    bool asc =
        direction == SwipeDirection.left || direction == SwipeDirection.up;
    bool vert =
        direction == SwipeDirection.up || direction == SwipeDirection.down;
    int index = vert ? verticalOrder(tile.index) : tile.index;
    int nextIndex = ((index + 1) / dim).ceil() * dim - (asc ? dim : 1);

    if (tiles.isNotEmpty) {
      var last = tiles.last;
      // If user swipes vertically use the verticalOrder list to retrieve the up/down index else use the existing index
      var lastIndex = last.nextIndex ?? last.index;
      lastIndex = vert ? verticalOrder(lastIndex) : lastIndex;
      if (_inSameRowOrCol(index, lastIndex)) {
        // If the order is ascending set the tile after the last processed tile
        // If the order is descending set the tile before the last processed tile
        nextIndex = lastIndex + (asc ? 1 : -1);
      }
    }

    return tile.copyWith(
      nextIndex: vert ? verticalOrderIndexOf(nextIndex) : nextIndex,
    );
  }

  /// Check whether the indexes are in the same row or column in the board.
  bool _inSameRowOrCol(int index, int nextIndex) {
    return (index % dim == nextIndex % dim &&
            (index - nextIndex).abs() < dim) ||
        (index ~/ dim == nextIndex ~/ dim);
  }

  void save() async {
    log("------------ Saving Game ----------------");
    final result = await storageServices.saveGame(
      key: state.mode.toString(),
      game: state,
    );
    if (result case Failure(exception: final e)) {
      log(e.toString());
    }
    if (result.isSuccess) {
      log("------------ Saved Game ----------------");
    }
  }
}

final gameCubitProvider = BlocProvider<GameCubit, GameState>((ref) {
  return GameCubit(
    ref.read(roundCubit.bloc),
    ref.read(nextDirectionCubit.bloc),
    ref.read(gameStorageServicesProvider),
  );
});
