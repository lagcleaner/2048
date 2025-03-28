import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await initialize();
  runApp(ProviderScope(child: const TwentyFortyEightApp()));
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Orientations
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Path-provider
  final directory = await getApplicationDocumentsDirectory();
  // Init Bloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );
}
