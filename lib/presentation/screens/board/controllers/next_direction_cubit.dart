import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:riverbloc/riverbloc.dart';

/// In case user swipes too fast we prevent for the next round to start until the current round finishes, we do that using the RoundCubit,
/// but instead of canceling that round we will queue it so that the round automatically starts as soon the current finishes,
/// that way we will prevent the user feeling like the game is lag-ish or slow.
class NextDirectionCubit extends Cubit<SwipeDirection?> {
  NextDirectionCubit() : super(null);

  void queue(SwipeDirection direction) {
    emit(direction);
  }

  void clear() {
    emit(null);
  }
}

final nextDirectionCubit = BlocProvider<NextDirectionCubit, SwipeDirection?>((
  ref,
) {
  return NextDirectionCubit();
});
