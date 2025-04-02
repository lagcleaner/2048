import 'dart:math' show Random;

import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:game2048/presentation/models/game_mode_model.dart';
import 'package:game2048/presentation/screens/board/models/game_state_model.dart';
import 'package:game2048/presentation/screens/board/models/tile_model.dart';
import 'package:riverbloc/riverbloc.dart';

class GameCubit extends Cubit<GameState> {
  // We will use this list to retrieve the right index when user swipes up/down
  // which will allow us to reuse most of the logic.
  final verticalOrder = [12, 8, 4, 0, 13, 9, 5, 1, 14, 10, 6, 2, 15, 11, 7, 3];

  GameCubit([GameState? state])
    : super(
        state ??
            GameState.newGame(best: 0, board: [], mode: GameMode.survival()),
      ) {
    //Load the last saved state or start a new game.
    // load();
  }

  void load([GameMode? mode]) async {
    //Access the box and get the first item at index 0
    //which will always be just one item of the Board model
    //and here we don't need to call fromJson function of the board model
    //in order to construct the Board model
    //instead the adapter we added earlier will do that automatically.

    // var box = await Hive.openBox<Board>('boardBox');
    //If there is no save locally it will start a new game.
    emit(_newGame(mode)); //box.get(0) ?? _newGame();
  }

  void newGame([GameMode? mode]) {
    emit(_newGame(mode));
  }

  // Check whether the indexes are in the same row or column in the board.
  bool _inSameRowOrCol(int index, int nextIndex) {
    return (index % state.mode.dimension == nextIndex % state.mode.dimension) ||
        (index ~/ state.mode.dimension == nextIndex ~/ state.mode.dimension);
  }

  bool move(SwipeDirection direction) {
    return false;
  }

  // Generates tiles at random place on the board
  Iterable<Tile> randomAssign(
    List<Tile> emptyTiles,
    int count, {
    bool countStrict = false,
  }) sync* {
    if (emptyTiles.isEmpty) return;

    if (count > emptyTiles.length) {
      count = emptyTiles.length;
    }

    final rn = Random();
    for (var i = 0; i < count; i++) {
      Tile randomTile;
      if (countStrict) {
        randomTile = emptyTiles.removeAt(rn.nextInt(emptyTiles.length));
      }
      randomTile = emptyTiles.elementAt(rn.nextInt(emptyTiles.length));
      // randomTile.value = pow(2, rn.nextInt(9) == 0 ? 2 : 1).toInt();
      yield randomTile;
    }
    return;
  }

  GameState _randomSet(int count, {bool countStrict = false}) {
    final tiles = state.copyWith().board;
    final emptyTiles = tiles.expand((e) => e).where((e) => e.isEmpty).toList();

    if (emptyTiles.isEmpty) return state;

    if (count > emptyTiles.length) {
      count = emptyTiles.length;
    }

    final rn = Random();
    for (var i = 0; i < count; i++) {
      Tile randomTile;
      if (countStrict) {
        randomTile = emptyTiles.removeAt(rn.nextInt(emptyTiles.length));
      }
      randomTile = emptyTiles.elementAt(rn.nextInt(emptyTiles.length));
      // randomTile.value = pow(2, rn.nextInt(9) == 0 ? 2 : 1).toInt();
    }
    return state.copyWith(board: tiles.toList());
  }

  GameState _newGame([GameMode? mode]) {
    final tiles = _generateBoard(mode ?? state.mode);
    randomAssign(tiles.expand((e) => e).toList(), 2);
    return GameState.newGame(best: state.best, board: tiles, mode: state.mode);
  }

  Tile _calculate(Tile tile, List<Tile> tiles, SwipeDirection direction) {
    bool asc =
        direction == SwipeDirection.left || direction == SwipeDirection.up;
    bool vert =
        direction == SwipeDirection.up || direction == SwipeDirection.down;
    // Get the first index from the left in the row
    // Example: for left swipe that can be: 0, 4, 8, 12
    // for right swipe that can be: 3, 7, 11, 15
    // depending which row in the column in the board we need
    // let's say the title.index = 6 (which is the 3rd tile from the left and 2nd from right side, in the second row)
    // ceil means it will ALWAYS round up to the next largest integer
    // NOTE: don't confuse ceil it with floor or round as even if the value is 2.1 output would be 3.
    // ((6 + 1) / 4) = 1.75
    // Ceil(1.75) = 2
    // If it's ascending: 2 * 4 – 4 = 4, which is the first index from the left side in the second row
    // If it's descending: 2 * 4 – 1 = 7, which is the last index from the left side and first index from the right side in the second row
    // If user swipes vertically use the verticalOrder list to retrieve the up/down index else use the existing index
    int index = vert ? verticalOrder[tile.index] : tile.index;
    int nextIndex = ((index + 1) / 4).ceil() * 4 - (asc ? 4 : 1);

    // If the list of the new tiles to be rendered is not empty get the last tile
    // and if that tile is in the same row as the curren tile set the next index for the current tile to be after the last tile
    if (tiles.isNotEmpty) {
      var last = tiles.last;
      // If user swipes vertically use the verticalOrder list to retrieve the up/down index else use the existing index
      var lastIndex = last.nextIndex ?? last.index;
      lastIndex = vert ? verticalOrder[lastIndex] : lastIndex;
      if (_inRange(index, lastIndex)) {
        // If the order is ascending set the tile after the last processed tile
        // If the order is descending set the tile before the last processed tile
        nextIndex = lastIndex + (asc ? 1 : -1);
      }
    }

    // Return immutable copy of the current tile with the new next index
    // which can either be the top left index in the row or the last tile nextIndex/index + 1
    return tile.copyWith(
      nextIndex: vert ? verticalOrder.indexOf(nextIndex) : nextIndex,
    );
  }

  // CAN SWIPE AREA
  bool canSwipeLeft() => state.board.any(canSwipe);
  bool canSwipeRight() =>
      state.board.map((e) => e.reversed.toList()).any(canSwipe);
  bool canSwipeUp() => state.cols.any(canSwipe);
  bool canSwipeDown() =>
      state.cols.map((e) => e.reversed.toList()).any(canSwipe);
  bool canSwipe(List<Tile> tiles) {
    for (int i = 0; i <= tiles.length; i++) {
      if (tiles[i].value == 0) {
        if (tiles.skip(i + 1).any((e) => e.value != 0)) {
          return true;
        }
      } else {
        Tile? nextNonZero = (tiles as Iterable<Tile?>)
            .skip(i + 1)
            .firstWhere((e) => e?.value != 0, orElse: () => null);
        if (nextNonZero?.value == tiles[i].value) return true;
      }
    }
    return false;
  }

  // SWIPE AREA
  void doSwipeLeft() => state.board.map(mergeTiles);
  void doSwipeRight() =>
      state.board.map((e) => e.reversed.toList()).map(mergeTiles);
  void doSwipeUp() => state.cols.map(mergeTiles);
  void doSwipeDown() =>
      state.cols.map((e) => e.reversed.toList()).map(mergeTiles);
  void mergeTiles(List<Tile> tiles) {
    for (int i = 0; i <= tiles.length; i++) {
      Iterable<Tile> toCheck = tiles.skip(i).skipWhile((t) => t.isEmpty);
      if (toCheck.isNotEmpty) {
        var tile = toCheck.first;
        var merge = toCheck.skip(1).skipWhile((e) => e.isEmpty).firstOrNull;
        if (merge != null && tile.value != merge.value) {
          merge = null;
        }
        if (tiles[i] != tile || merge != null) {
          int resultValue = tile.value;
          if (merge != null) {
            resultValue += merge.value;
            // merge.value = 0;
          }
          // tile.value = 0;
          // tiles[i].value = resultValue;
        }
      } else {
        break;
      }
    }
  }

  Tile _calculate(Tile tile, List<Tile> tiles, direction) {
    // Get the first index from the left in the row
    // Example: for left swipe that can be: 0, 4, 8, 12
    // depending which row in the column in the board we need
    int index = tile.index;
    int nextIndex = ((index + 1) / 4).ceil() * 4 - 4;

    // If the list of the new tiles to be rendered is not empty get the last tile
    // and if that tile is in the same row as the curren tile set the next index for the current tile to be after the last tile
    if (tiles.isNotEmpty) {
      var last = tiles.last;
      var lastIndex = last.nextIndex ?? last.index;
      if (_inSameRowOrCol(index, lastIndex)) {
        nextIndex = lastIndex + 1;
      }
    }

    // Return immutable copy of the current tile with the new next index
    // which can either be the top left index in the row or the last tile nextIndex/index + 1
    return tile.copyWith(nextIndex: nextIndex);
  }
}

final gameCubitProvider = BlocProvider<GameCubit, GameState>((ref) {
  return GameCubit();
});
