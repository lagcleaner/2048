import 'package:riverbloc/riverbloc.dart';

/// A Notifier when a round starts, in order to prevent the next round starts before the current ends
/// prevent's animation issues when user tries to move tiles too soon.
class RoundCubit extends Cubit<bool> {
  RoundCubit() : super(true);

  void end() {
    emit(true);
  }

  void begin() {
    emit(false);
  }
}

final roundCubit = BlocProvider<RoundCubit, bool>((ref) {
  return RoundCubit();
});
