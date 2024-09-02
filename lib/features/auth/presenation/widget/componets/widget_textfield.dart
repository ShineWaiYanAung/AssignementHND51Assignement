import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    required this.hintText,
    required this.controller,
    super.key,
    required this.width,
  });
  final TextEditingController controller;
  final double width;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 0.6 *width,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: const [
          BoxShadow(
              color: Colors.black45,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(1, 2)
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child:  TextField(
        controller:  controller,
        decoration: InputDecoration(
            border: InputBorder.none, // Removes the underline border
            enabledBorder: InputBorder.none, // Removes the underline border when enabled
            focusedBorder: InputBorder.none, // Removes the underline border when focused
            hintText: hintText,
            hintStyle: TextStyle(
                color: Color(0xFf2D3E6A),
                fontFamily: 'SecondaryFont',
                fontSize: 15
            )
          // Additional styling can go here
        ),
      ),
    );
  }
}

