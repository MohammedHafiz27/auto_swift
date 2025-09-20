import 'package:auto_swift/Core/helper/cache_helper.dart';
import 'package:auto_swift/Core/helper/cache_helper_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<ThemeMode> {
  AppCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      CacheHelper.saveData(key: CacheHelperKey.isDarkMode, value: true);
    } else {
      emit(ThemeMode.light);
      CacheHelper.saveData(key: CacheHelperKey.isDarkMode, value: false);
    }
  }

  void _loadTheme() {
    final isDarkMode = CacheHelper.getData(key: CacheHelperKey.isDarkMode);
    if (isDarkMode != null && isDarkMode == true) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }
}
