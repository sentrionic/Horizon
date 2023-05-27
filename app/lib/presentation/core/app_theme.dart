import 'package:flutter/material.dart';
import 'package:horizon/presentation/core/app_colors.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
  iconTheme: const IconThemeData().copyWith(color: Colors.white),
  fontFamily: 'Montserrat',
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      color: Colors.white,
      fontSize: 36.0,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: TextStyle(
      fontSize: 12.0,
      color: Colors.grey[300],
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0,
    ),
    bodyLarge: const TextStyle(
      color: Colors.white70,
      fontSize: 13.0,
      letterSpacing: 1.0,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey[300],
      letterSpacing: 1.0,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.black,
    secondary: ThemeColors.brandGreen,
    brightness: Brightness.dark,
    background: ThemeColors.backgroundColor,
  ),
);
