import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../widget/Components/course_status.dart';
import '../../widget/Components/main_title.dart';
import '../../widget/Components/up_bar_widget.dart';
import '../CourseDetailsPage/course_detail.page.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ///UpperWidgets
        UpBarWidget(changesControl: true),
        const SizedBox(
          height: 10,
        ),

        ///MainTitle
        const MainTitle(
          title: "DashBoard",
          fontSize: 20,
        ),

        ///ProgressBar
        buildProgressBox(context),

        ///SecondaryTitle
        const SizedBox(
          height: 10,
        ),
        const MainTitle(title: "Your Courses", fontSize: 15),

        ///Courses
        buildCourses(context),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 10,
        ),

        ///Upcoming Event
        const MainTitle(title: "Up Coming Event", fontSize: 15),
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 10,
        ),

        ///BuildComingEvent
        buildUpComingEvent(),
      ],
    );
  }

  Widget buildUpComingEvent() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text("Hi"),
                subtitle: const Text("data"),
              ),
            ),
          );
        },
      ),
    );
  }

  ///Courses
  Widget buildCourses(context) {
    return InkWell(
      ///Need to Be implemented
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CourseDetail(),
      )),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 200,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///ProgressBar
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
