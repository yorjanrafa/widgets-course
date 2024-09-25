import 'package:a01_widgets/config/theme/app_theme.dart';
import 'package:a01_widgets/presentation/screens/buttons/buttons_screen.dart';
import 'package:a01_widgets/presentation/screens/cards/cards_screen.dart';
import 'package:a01_widgets/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).getTheme(),
        home: const HomeScreen(),
        routes: {
          '/buttons': (context) => ButtonsScreen(),
          '/cards': (context) => CardsScreen(),
        });
  }
}
