import 'dart:convert';

import 'package:game2048/core/error_handling/result.dart';
import 'package:game2048/core/error_handling/unit.dart';
import 'package:game2048/presentation/screens/board/models/game_state_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverbloc/riverbloc.dart';

class GameStorageServices {
  final _boxName = 'GameStateBox';

  Future<Box<String>> get _box async => await Hive.openBox<String>(_boxName);

  Future<Result<GameState?, Exception>> loadGame({
    String key = 'default',
  }) async {
    return handleResult(() async {
      final box = await _box;
      final String? rawValue = box.get(key);
      return rawValue != null
          ? GameState.fromJson(json.decode(rawValue) as Map<String, dynamic>)
          : null;
    });
  }

  Future<Result<Unit, Exception>> saveGame({
    required GameState game,
    String key = 'default',
  }) async {
    return handleResult(() async {
      final box = await _box;
      final String rawValue = json.encode(game.toJson());
      await box.put(key, rawValue);
      return unit;
    });
  }
}

Future<Result<T, Exception>> handleResult<T>(
  Future<T> Function() function,
) async {
  try {
    return Success(await function());
  } on HiveError catch (e) {
    return Failure(Exception(e.message));
  } on Exception catch (e) {
    return Failure(e);
  } catch (e) {
    return Failure(Exception(e.toString()));
  }
}

final gameStorageServicesProvider = Provider((ref) => GameStorageServices());
