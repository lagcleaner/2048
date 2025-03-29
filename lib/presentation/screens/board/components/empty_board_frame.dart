// ignore_for_file: public_member_api_docs, sort_constructors_first
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
        color: boardColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Stack(
        children: List.generate(16, (i) {
          //Render the empty board in 4x4 GridView
          var x = ((i + 1) / 4).ceil();
          var y = x - 1;

          var top = y * (tileSize) + (x * 12.0);
          var z = (i - (4 * y));
          var left = z * (tileSize) + ((z + 1) * 12.0);

          return Positioned(
            top: top,
            left: left,
            child: Container(
              width: tileSize,
              height: tileSize,
              decoration: BoxDecoration(
                color: emptyTileColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
