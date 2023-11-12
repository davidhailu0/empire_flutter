import 'package:empire_flutter/util/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: AppConstants.fontFamily,
  primaryColor: const Color(0xFF6C63FF),
  secondaryHeaderColor: const Color(0xFF1ED7AA),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF6C63FF))),
  colorScheme: const ColorScheme.light(
          primary: Color(0xFF6C63FF),
          tertiary: Color(0xff6165D7),
          tertiaryContainer: Color(0xff171DB6),
          secondary: Color(0xFF3A85AA))
      .copyWith(background: const Color(0xFFF3F3F3))
      .copyWith(error: const Color(0xFFE84D4F)),
);
