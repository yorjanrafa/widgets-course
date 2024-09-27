import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.blueAccent,
  Colors.red,
  Colors.yellow,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0, 'El color no debe ser menor a 0'),
        assert(selectedColor < colorsList.length,
            'El color no debe ser mayor a ${colorsList.length - 1}');

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorsList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
        brightness: isDarkMode ? Brightness.dark : Brightness.light);
  }
}
