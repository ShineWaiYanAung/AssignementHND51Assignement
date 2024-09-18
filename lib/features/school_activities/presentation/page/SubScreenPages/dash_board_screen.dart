import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../auth/presenation/Domain/UserAccount/lecture.dart';
import '../../../data/models/models.dart';

import '../../../data/respository/coure_repsository.dart';
import '../../widget/Components/course_status.dart';
import '../../widget/Components/main_title.dart';
import '../../widget/Components/up_bar_widget.dart';
import '../CourseDetailsPage/course_detail.dart';
import 'events.dart';

class DashBoardScreen extends StatelessWidget {
  final List<Lecture> courses;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  final CourseRepository repository = CourseRepository();

  DashBoardScreen({super.key, this.scaffoldKey, required this.courses});

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
          final allCourses = snapshot.data!;
          final filteredCourses = _filterCoursesByLectures(allCourses, courses);

          return ListView(
            children: [
              ///UpperWidgets
              UpBarWidget(changesControl: true),
              const SizedBox(height: 10),

              ///MainTitle
              const MainTitle(title: "DashBoard", fontSize: 20),

              ///ProgressBar
              buildProgressBox(context, filteredCourses.length),

              ///SecondaryTitle
              const SizedBox(height: 10),
              const MainTitle(title: "Your Courses", fontSize: 15),

              ///Courses
              buildCourses(context, filteredCourses),

              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: 10,
              ),

              ///Upcoming Event
              const MainTitle(title: "Upcoming Event", fontSize: 15),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: 10,
              ),

              ///BuildUpcomingEvent
              buildUpcomingEvent(),
            ],
          );
        }
      },
    );
  }

  List<CourseModel> _filterCoursesByLectures(List<CourseModel> allCourses, List<Lecture> lectures) {
    // Extract the lecture names into a Set for fast lookup
    final lectureNames = lectures.map((lecture) => lecture.name.toLowerCase()).toSet();

    // Print out the lecture names for debugging
    print("Lecture Names (lowercase): $lectureNames");

    // Filter courses based on whether their names match the selected lecture names
    final filteredCourses = allCourses.where((course) {
      final courseNameLower = course.courseName.toLowerCase();
      final isMatch = lectureNames.contains(courseNameLower);

      // Print out each course and whether it was included in the filtered results
      print("Checking course: $courseNameLower - Match: $isMatch");

      return isMatch;
    }).toList();

    // Print out all courses for debugging
    print("All Courses:");
    allCourses.forEach((course) => print(course.courseName));

    // Print out the filtered courses for debugging
    print("Filtered Courses:");
    filteredCourses.forEach((course) => print(course.courseName));

    return filteredCourses;
  }



  List<String> events = ['IOT Show',"Website Design Contents"];
  Widget buildUpcomingEvent() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {

        final  title = events[index];

          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Events(title: title,),));
            },
            child: Padding(
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
                  title:  Text(title.toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                  subtitle: const Text("HND51",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildCourses(BuildContext context, List<CourseModel> courses) {
    print("Building Courses with count: ${courses.length}"); // Debug print

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: courses.length,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          final eachCourse = courses[index];
          print("Course ${index}: ${eachCourse.courseName}"); // Debug print

          return Padding(
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          image: AssetImage(eachCourse.coursePic),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10), // Added padding for spacing
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eachCourse.title,
                          style: TextStyle(fontSize: 8),
                        ),
                        SizedBox(height: 8.0), // Added spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              eachCourse.courseName,
                              style: TextStyle(fontSize: 8),
                            ),
                            Spacer(), // Adds flexible space
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CourseDetail(course: eachCourse),
                                  )),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "View",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}

Widget buildProgressBox(BuildContext context, int courseCount) {
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
        borderRadius: BorderRadius.circular(30),
      ),
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
              SizedBox(height: 15),

              ///Completed Courses
              CourseStatus(
                title: "Completed Courses",
                count: courseCount,
                iconData: Icons.task,
              ),
              SizedBox(height: 15),

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
                "Overview Progress",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 12,
                  fontFamily: "SecondaryFont",
                  color: Colors.white,
                ),
              ),
              SizedBox(height: index3),

              ///This Needs to Be done
              CircularPercentIndicator(
                animation: true,
                animationDuration: 5000,
                progressColor: Theme.of(context).primaryColor,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
                percent: 0.4,
                lineWidth: 10,
                radius: 60,
                center: const Text(
                  "40%",
                  style: TextStyle(
                    fontFamily: "SecondaryFont",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
