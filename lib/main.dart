import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(LifeRoutineApp());
}

class LifeRoutineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeRoutine',
      theme: AppTheme.lightTheme,
      home: HomePage(),
    );
  }
}
