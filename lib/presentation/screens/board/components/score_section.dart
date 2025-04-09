import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/components/gaps.dart';
import 'package:game2048/presentation/components/score.dart';
import 'package:game2048/presentation/screens/board/controllers/game_cubit.dart';

class ScoreSection extends ConsumerWidget {
  const ScoreSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(gameCubitProvider.select((board) => board.score));
    final best = ref.watch(gameCubitProvider.select((board) => board.best));
    final scores = <Widget>[
      Score(label: 'Best', score: '$best'),
      Score(label: 'Score', score: '$score'),
    ];
    //
    return MediaQuery.of(context).size.width < 360
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: scores..insert(1, gapH8),
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: scores..insert(1, gapW8),
        );
  }
}
