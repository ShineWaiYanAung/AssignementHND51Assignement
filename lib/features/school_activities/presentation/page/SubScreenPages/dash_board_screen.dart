import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../widget/Componets/course_status.dart';
import '../../widget/Componets/main_title.dart';
import '../../widget/Componets/up_bar_widget.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///UpperWidgets
        UpBarWidget(changesControl: true),

        ///MainTitle
        const MainTitle(title: "DashBoard"),

        ///
        buildProgressBox(context)
      ],
    );
  }

  Widget buildProgressBox(context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double index = height * 0.03;
    final double index1 = height * 0.04;
    final double index2 = width * 0.06;
    final double index3 = width * 0.08;
    return Padding(
      padding: EdgeInsets.only(top: index),
      child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: index2, vertical: index1),
          decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///MainColumn
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Enrolled Courses
                  CourseStatus(
                    title: "Enrolled Courses",
                    count: 4,
                    iconData: Icons.book,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ///Completed Courses
                  CourseStatus(
                    title: "Completed Courses",
                    count: 4,
                    iconData: Icons.task,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ///Progress Courses
                  CourseStatus(
                    title: "Progress Courses",
                    count: 0,
                    iconData: Icons.settings,
                  ),
                ],
              ),

              ///MainColumn
              Column(
                children: [
                  const Text(
                    "OverView Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 12,
                      fontFamily: "SecondaryFont",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: index3,
                  ),

                  ///This Need to Be done
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 5000,
                    progressColor: Theme.of(context).primaryColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.3),
                    percent: 0.4,
                    lineWidth: 10,
                    radius: 60,
                    center: const Text(
                      "40%",
                      style: TextStyle(
                          fontFamily: "SecondaryFont",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
