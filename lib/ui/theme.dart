import 'package:flutter/material.dart';

const colorScheme = ColorScheme.light(
  primary: Color(0xFF058879),
  secondary: Color(0xFF0c0c0c),
  tertiary: Color(0xFFc2d0db),
  background: Color(0xFFFCFCFC),
  surface: Color(0xFFe2e1f6),
  error: Color(0xFFB00020),
  onPrimary: Color(0xFFe2e1f6),
  onSecondary: Color(0xFFe2e1f6),
  onTertiary: Color(0xFF000000),
  onError: Color(0xFFFFFFFF),
);

const textTheme = TextTheme(
  titleSmall: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
  bodyLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
);

final theme = ThemeData(
  colorScheme: colorScheme,
  textTheme: textTheme,
  useMaterial3: true,
);
