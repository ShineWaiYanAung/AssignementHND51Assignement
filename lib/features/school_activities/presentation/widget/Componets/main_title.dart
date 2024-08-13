import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final double index = height * 0.02;
    return Padding(
      padding:  EdgeInsets.only(top: index),
      child: Text(title,
        style: TextStyle(
          fontFamily: 'PrimaryFont',
          fontSize: 20,
          letterSpacing: 5,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),),
    );
  }
}

