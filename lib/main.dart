import 'package:flutter/material.dart';

import 'config/ theme/theme.dart';
import 'features/school_activities/presentation/page/mainControlScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:  primaryColor,
        focusColor: focusColor,
        scaffoldBackgroundColor: lightModeBackGroundColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: primaryTextColor),   // Primary text color
          bodyMedium: TextStyle(color: labelMediumTextColor),
          bodySmall: TextStyle(color: iconTextColor),// Seconda// Secondary text color

         ),
        useMaterial3: true,
      ),
      home:  MainControlScreen(),
    );
  }
}
