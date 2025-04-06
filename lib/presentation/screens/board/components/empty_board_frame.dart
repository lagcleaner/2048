import 'package:flutter/widgets.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';
import 'package:game2048/presentation/models/game_mode_model.dart';

class EmptyBoardFrame extends StatelessWidget {
  const EmptyBoardFrame({
    super.key,
    required this.boardSize,
    required this.tileSize,
    required this.gameMode,
  });

  final double boardSize;
  final double tileSize;
  final GameMode gameMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boardSize,
      height: boardSize,
      decoration: BoxDecoration(
        color: ThemeConstants.darkBrown,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Stack(
        children: List.generate(gameMode.squaredDim, (i) {
          //Render the empty board in dimXdim GridView
          var x = ((i + 1) / gameMode.dimension).ceil();
          var y = x - 1;

          var top = y * (tileSize) + (x * 12.0);
          var z = (i - (gameMode.dimension * y));
          var left = z * (tileSize) + ((z + 1) * 12.0);

          return Positioned(
            top: top,
            left: left,
            child: Container(
              width: tileSize,
              height: tileSize,
              decoration: BoxDecoration(
                color: ThemeConstants.lightBrown,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
