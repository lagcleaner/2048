import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/components/gaps.dart';
import 'package:game2048/presentation/components/score.dart';

class ScoreSection extends ConsumerWidget {
  const ScoreSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final score = ref.watch(boardManager.select((board) => board.score));
    // final best = ref.watch(boardManager.select((board) => board.best));
    final scores = <Widget>[
      Score(
        label: 'Best',
        score: '8978996',
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
      Score(label: 'Score', score: '12314'),
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
