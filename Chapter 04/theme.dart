// theme.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.blue;
}

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
  );
}
