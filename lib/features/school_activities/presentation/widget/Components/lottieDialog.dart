import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Lottie.asset('AppImages/lottie/zoomJSON.json'), // Ensure the Lottie file is in your assets
          SizedBox(height: 5),
          Text(
            "Zoom isn't available right now.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF6489EB),
                fontFamily: "PrimaryFont"),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close',style: TextStyle(color: Colors.black,fontFamily: "PrimaryFont",fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
