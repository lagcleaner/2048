// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/components/button.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';
import 'package:game2048/presentation/screens/board/components/animated_tile.dart';
import 'package:game2048/presentation/screens/board/controllers/game_cubit.dart';

class TileBoardWidget extends ConsumerWidget {
  const TileBoardWidget({
    required this.moveAnimation,
    required this.scaleAnimation,
    required this.boardSize,
    required this.tileSize,
  });

  final CurvedAnimation moveAnimation;
  final CurvedAnimation scaleAnimation;
  final double boardSize;
  final double tileSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameCubitProvider);

    return SizedBox(
      width: boardSize,
      height: boardSize,
      child: Stack(
        children: [
          ...game.tiles.map((tile) {
            return AnimatedTile(
              key: ValueKey(tile.id),
              tile: tile,
              size: tileSize,
              moveAnimation: moveAnimation,
              scaleAnimation: scaleAnimation,
              dimension: game.mode.dimension,
              child: Container(
                width: tileSize,
                height: tileSize,
                decoration: BoxDecoration(
                  color: ThemeConstants.numTileColor[tile.value],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Center(
                  child: Text(
                    '${tile.value}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color:
                          tile.value < 8
                              ? ThemeConstants.greyText
                              : ThemeConstants.whiteText,
                    ),
                  ),
                ),
              ),
            );
          }),
          if (game.status.isOver)
            Positioned.fill(
              child: Container(
                color: ThemeConstants.overlayColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      game.status.isWon ? 'You win!' : 'Game over!',
                      style: const TextStyle(
                        color: ThemeConstants.greyText,
                        fontWeight: FontWeight.bold,
                        fontSize: 64.0,
                      ),
                    ),
                    ButtonWidget(
                      text: game.status.isWon ? 'New Game' : 'Try again',
                      onPressed: () {
                        ref.read(gameCubitProvider.bloc).newGame();
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
