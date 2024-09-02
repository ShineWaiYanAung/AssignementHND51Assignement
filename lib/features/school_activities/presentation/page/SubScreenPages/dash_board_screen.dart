import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../data/models/models.dart';
import '../../../data/respository/coure_repsository.dart';
import '../../widget/Components/course_status.dart';
import '../../widget/Components/main_title.dart';
import '../../widget/Components/up_bar_widget.dart';
import '../CourseDetailsPage/course_detail.dart';

class DashBoardScreen extends StatelessWidget {
  final CourseRepository repository = CourseRepository();
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CourseModel>>(
        future: repository.fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No courses available.'));
          } else {
            final courses = snapshot.data!;
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
                buildProgressBox(context, courses.length),

                ///SecondaryTitle
                const SizedBox(
                  height: 10,
                ),
                const MainTitle(title: "Your Courses", fontSize: 15),

                ///Courses
                buildCourses(context, courses),
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
        });
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
  Widget buildCourses(context, courses) {
    final allCourses = courses;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: allCourses.length,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          final eachCourses = allCourses[index];
          print(eachCourses);
          return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            image: DecorationImage(
                                image: AssetImage(eachCourses.coursePic),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 10), // Added padding for spacing
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eachCourses.title,
                            style: TextStyle(fontSize: 8),),
                          SizedBox(height: 8.0), // Added spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(eachCourses.courseName,
                                style: TextStyle(fontSize: 8),),
                              Spacer(), // Adds flexible space
                              ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                                  child: InkWell(
                                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CourseDetail(course: eachCourses,),
                                    ),),
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text("View",  style: TextStyle(fontSize: 8),)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        }
      ),
    );
  }
}

///ProgressBar
Widget buildProgressBox(context, courseCount) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Enrolled Courses
                CourseStatus(
                  title: "Enrolled Courses",
                  count: courseCount,
                  iconData: Icons.book,
                ),
                SizedBox(
                  height: 15,
                ),

                ///Completed Courses
                CourseStatus(
                  title: "Completed Courses",
                  count: courseCount,
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
