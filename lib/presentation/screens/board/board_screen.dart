// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer' show log;
import 'dart:math' show min, max;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/components/button.dart';
import 'package:game2048/presentation/components/gaps.dart';
import 'package:game2048/presentation/components/theme_toggle_button.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';
import 'package:game2048/presentation/models/game_mode_enum.dart';
import 'package:game2048/presentation/screens/board/components/empty_board_frame.dart';
import 'package:game2048/presentation/screens/board/components/game_movement_detector.dart';
import 'package:game2048/presentation/screens/board/components/score_section.dart';
import 'package:game2048/presentation/screens/board/controllers/game_cubit.dart';
import 'package:game2048/presentation/screens/board/models/board_args_model.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key, this.args});

  static const String route = "/board";
  final Object? args;

  @override
  Widget build(BuildContext context) {
    BoardArgs boardArgs = switch (args) {
      Map<String, dynamic> args => BoardArgs.fromJson(args),
      BoardArgs args => args,
      int dimension => BoardArgs.survivalDefaultArgs.copyWith(
        gameMode: BoardArgs.survivalDefaultArgs.gameMode.copyWith(
          dimension: dimension,
        ),
      ),
      GameModeEnum.survivalMaxScore => BoardArgs.survivalDefaultArgs,
      GameModeEnum.timeRecord => BoardArgs.timeRecordDefaultArgs,
      Object() || null => BoardArgs.survivalDefaultArgs,
    };

    return _BoardScreenInternal(boardArgs: boardArgs);
  }
}

class _BoardScreenInternal extends ConsumerWidget {
  const _BoardScreenInternal({Key? key, required this.boardArgs})
    : super(key: key);
  final BoardArgs boardArgs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = max(
      290.0,
      min(
        (MediaQuery.of(context).size.shortestSide * 0.90).floorToDouble(),
        460.0,
      ),
    );
    final dimension = boardArgs.gameMode.dimension;
    final sizePerTile = (size / dimension).floorToDouble();
    final tileSize = sizePerTile - 12.0 - (12.0 / dimension);
    final boardSize = sizePerTile * dimension;

    log(boardSize.toString());
    log(tileSize.toString());

    return GameMovementDetector(
      onSwipeUp: () async => log('up'),
      onSwipeDown: () async => log('down'),
      onSwipeLeft: () async => log('left'),
      onSwipeRight: () async => log('right'),
      child: Scaffold(
        appBar: AppBar(actions: [ThemeToggleButton()]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Title
            Padding(
              padding: EdgeInsets.zero,
              child: Center(
                child: Text(
                  '2048',
                  style: TextStyle(
                    color: ThemeConstants.greyText,
                    fontWeight: FontWeight.bold,
                    fontSize: 52.0,
                  ),
                ),
              ),
            ),
            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScoreSection(),
                  Row(
                    children: [
                      ButtonWidget(
                        icon: Icons.undo,
                        onPressed: () {
                          //Undo the round.
                        },
                      ),
                      gapW16,
                      ButtonWidget(
                        icon: Icons.refresh,
                        onPressed: () {
                          //Restart the game
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Board
            BoardWidget(
              boardSize: boardSize,
              tileSize: tileSize,
              boardArguments: boardArgs,
            ),
          ],
        ),
      ),
    );
  }
}

class BoardWidget extends ConsumerStatefulWidget {
  final double boardSize;
  final double tileSize;
  final BoardArgs boardArguments;

  BoardWidget({
    super.key,
    required this.boardArguments,
    required this.boardSize,
    required this.tileSize,
  });

  @override
  ConsumerState<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends ConsumerState<BoardWidget>
    with TickerProviderStateMixin, WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    final bloc = ref.read(gameCubitProvider.bloc);
    bloc.newGame(widget.boardArguments.gameMode);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EmptyBoardFrame(
          gameMode: widget.boardArguments.gameMode,
          boardSize: widget.boardSize,
          tileSize: widget.tileSize,
        ),
        // TileBoardWidget(
        //   gameMode: widget.boardArguments.gameMode,
        //   boardSize: widget.boardSize,
        //   tileSize: widget.tileSize,
        //   controller: controller,
        // ),
      ],
    );
  }
}
