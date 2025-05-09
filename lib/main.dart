import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game2048/presentation/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  // Hive
  await Hive.initFlutter(directory.path);
  // Desktop size
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMinWindowSize(Size(400, 700));
  }
}
