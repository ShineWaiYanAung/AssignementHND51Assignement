import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widget/Components/lottieDialog.dart';
import '../../../widget/Components/scheduleMetting.dart';

class ZoomMeeting extends StatelessWidget {
  const ZoomMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 15),

          // Zoom
          Container(
            color: Theme.of(context).primaryColor,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Zoom",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontFamily: 'SecondaryFont',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  offset: Offset(2, 2), // Even shadow in both horizontal and vertical directions
                  blurRadius: 1,
                ),
              ],
            ),
            height: 200,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildUpComingLabel(context),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildMeetingComponents(
                      context,
                      Icons.video_camera_front_outlined,
                      'Zoom',
                          () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LottieDialogContent();
                          },
                        );
                      },
                    ),
                    buildMeetingComponents(
                      context,
                      Icons.calendar_today_outlined,
                      'Schedule',
                          () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ScheduleDialogContent(); // Or use another dialog content if needed
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build Meeting Components
  Widget buildMeetingComponents(
      BuildContext context,
      IconData iconData,
      String toolTip,
      VoidCallback onTap
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).focusColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 3,
            blurRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onTap,
        color: Theme.of(context).scaffoldBackgroundColor,
        icon: Icon(iconData),
        iconSize: 70,
        tooltip: toolTip,
      ),
    );
  }

  // Upcoming Meeting Label
  Widget buildUpComingLabel(BuildContext context) {
    return Text(
      "UpComing Meeting",
      style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          letterSpacing: 2,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          fontFamily: 'PrimaryFont'
      ),
    );
  }
}
