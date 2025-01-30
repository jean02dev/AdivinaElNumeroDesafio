import 'package:flutter/material.dart';

const seedColor = Colors.lightBlue;

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      listTileTheme: const ListTileThemeData(iconColor: seedColor));
}
