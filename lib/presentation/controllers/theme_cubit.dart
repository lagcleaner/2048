import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:riverbloc/riverbloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void change(ThemeMode mode) {
    emit(mode);
  }

  void toggle() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final initialValue = ThemeMode.values[(json['ThemeMode'] as int?) ?? 0];
    emit(initialValue);
    return initialValue;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'ThemeMode': state.index};
  }
}

final themeProvider = BlocProvider((ref) => ThemeCubit());
