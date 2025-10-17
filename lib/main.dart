import 'package:flutter/material.dart';
import 'package:woodcore_assessment/core/utils/theme/app_theme.dart';
import 'package:woodcore_assessment/features/bottom_navigation/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Woodcore',
      theme: AppTheme.lightTheme,
      home: const MainNavigationScreen(),
    );
  }
}
