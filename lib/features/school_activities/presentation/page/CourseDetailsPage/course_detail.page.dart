import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/widget/Componets/main_title.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/widget/Componets/up_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: ListView(
            children: [
              ///UpBar
              UpBarWidget(changesControl: false),

              ///FirstTitle
              MainTitle(title: "Your Course", fontSize: 20),

              const SizedBox(
                height: 10,
              ),

              ///NeedToImplement
              buildCourseOverView(context),
              const SizedBox(
                height: 10,
              ),
              // SegmentedTabControl(tabs: [])
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourseOverView(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor, blurRadius: 1),
          ],
          color: Theme.of(context).focusColor),
    );
  }
}
