import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const MainTitle({
    required this.title,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final double index = height * 0.02;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Text(title,
        style: TextStyle(
          fontFamily: 'PrimaryFont',
          fontSize: fontSize,
          letterSpacing: 5,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),),
    );
  }
}

