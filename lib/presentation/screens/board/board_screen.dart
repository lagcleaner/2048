// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/components/button.dart';
import 'package:game2048/presentation/components/gaps.dart';
import 'package:game2048/presentation/components/theme_toggle_button.dart';
import 'package:game2048/presentation/misc/extensions/size_context_extension.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';
import 'package:game2048/presentation/models/game_mode_enum.dart';
import 'package:game2048/presentation/screens/board/components/empty_board_frame.dart';
import 'package:game2048/presentation/screens/board/components/game_movement_detector.dart';
import 'package:game2048/presentation/screens/board/components/score_section.dart';
import 'package:game2048/presentation/screens/board/components/tile_board.dart';
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
    //
    final size = context.boardSize;
    final dim = boardArgs.gameMode.dimension;
    final sizePerTile = (size / dim).floorToDouble();
    final tileSize = sizePerTile - 12.0 - (12.0 / dim);
    final boardSize = sizePerTile * dim;

    return _BoardScreenInternal(
      boardArgs: boardArgs,
      boardSize: boardSize,
      tileSize: tileSize,
    );
  }
}

class _BoardScreenInternal extends ConsumerStatefulWidget {
  const _BoardScreenInternal({
    required this.boardSize,
    required this.tileSize,
    required this.boardArgs,
  });

  final double boardSize;
  final double tileSize;
  final BoardArgs boardArgs;

  @override
  ConsumerState<_BoardScreenInternal> createState() =>
      _BoardScreenInternalState();
}

class _BoardScreenInternalState extends ConsumerState<_BoardScreenInternal>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  //The contoller used to move the the tiles
  late final AnimationController _moveController = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  )..addStatusListener((status) {
    //When the movement finishes merge the tiles and start the scale animation which gives the pop effect.
    if (status == AnimationStatus.completed) {
      ref.read(gameCubitProvider.bloc).merge();
      _scaleController.forward(from: 0.0);
    }
  });

  //The curve animation for the move animation controller.
  late final CurvedAnimation _moveAnimation = CurvedAnimation(
    parent: _moveController,
    curve: Curves.easeInOut,
  );

  //The contoller used to show a popup effect when the tiles get merged
  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..addStatusListener((status) {
    //When the scale animation finishes end the round and if there is a queued movement start the move controller again for the next direction.
    if (status == AnimationStatus.completed) {
      if (ref.read(gameCubitProvider.bloc).endRound()) {
        _moveController.forward(from: 0.0);
      }
    }
  });

  //The curve animation for the scale animation controller.
  late final CurvedAnimation _scaleAnimation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final bloc = ref.read(gameCubitProvider.bloc);
    bloc.newGame(widget.boardArgs.gameMode);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //Save current state when the app becomes inactive
    if (state == AppLifecycleState.inactive) {
      // ref.read(gameCubitProvider.bloc).save();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    //Dispose the animations.
    _moveAnimation.dispose();
    _scaleAnimation.dispose();
    _moveController.dispose();
    _scaleController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(gameCubitProvider.bloc).load(widget.boardArgs.gameMode);
    return GameMovementDetector(
      onSwipe: (direction) async {
        log(direction.toString());
        if (ref.read(gameCubitProvider.bloc).move(direction)) {
          _moveController.forward(from: 0.0);
        }
      },
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
                          ref.read(gameCubitProvider.bloc).undo();
                        },
                      ),
                      gapW16,
                      ButtonWidget(
                        icon: Icons.refresh,
                        onPressed: () {
                          //Restart the game
                          ref
                              .read(gameCubitProvider.bloc)
                              .newGame(widget.boardArgs.gameMode);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Board
            Stack(
              children: [
                EmptyBoardFrame(
                  gameMode: widget.boardArgs.gameMode,
                  boardSize: widget.boardSize,
                  tileSize: widget.tileSize,
                ),
                TileBoardWidget(
                  moveAnimation: _moveAnimation,
                  scaleAnimation: _scaleAnimation,
                  boardSize: widget.boardSize,
                  tileSize: widget.tileSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
