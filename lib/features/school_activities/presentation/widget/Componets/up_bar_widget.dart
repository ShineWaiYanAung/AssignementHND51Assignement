import 'package:flutter/material.dart';

class UpBarWidget extends StatefulWidget {
  bool changesControl;
  UpBarWidget({
    required this.changesControl,
    super.key,
  });

  @override
  State<UpBarWidget> createState() => _UpBarWidgetState();
}

class _UpBarWidgetState extends State<UpBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.changesControl
            ? GestureDetector(
                onTap: () {
                  ///Drawer Function Need to be done
                },
                child: CircleAvatar(
                  radius: 30,
                  child: Image.asset("AppImages/PersonIcon/maleStudent.png"),
                ),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset("AppImages/BackIcon/backButton.png")),
        Column(
          children: [
            Image.asset(
              "AppImages/UniversityIcon/GUSGO.png",
              height: 50,
            ),
            Text(
              "GUSTO",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
                fontSize: 16,
                fontFamily: 'PrimaryFont',
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
