import 'dart:ui';

import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/CourseDetailsPage/subCourseDetailPages/hand_in_lecuture.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/CourseDetailsPage/subCourseDetailPages/lecture_detail.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/CourseDetailsPage/subCourseDetailPages/zoom_meeting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

import '../../widget/Components/main_title.dart';
import '../../widget/Components/up_bar_widget.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            ///UpBar
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: UpBarWidget(changesControl: false),
            ),

            ///FirstTitle
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: MainTitle(title: "Your Course", fontSize: 20),
            ),

            const SizedBox(
              height: 10,
            ),

            ///NeedToImplement
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: buildCourseOverView(context),
            ),
            const SizedBox(
              height: 30,
            ),

            // Wrapping SegmentedTabControl and TabBarView with DefaultTabController
            DefaultTabController(
              length: 3, // Number of tabs
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: SegmentedTabControl(
                      indicatorPadding: const EdgeInsets.all(10),
                      textStyle: const TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SecondaryFont'),
                      height: 70,
                      tabTextColor: Colors.white,
                      barDecoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 2,
                              blurRadius: 2)
                        ],
                      ),
                      selectedTabTextColor: Theme.of(context).focusColor,
                      indicatorDecoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 1,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tabs: const [
                        SegmentTab(
                          label: "Lectures",
                        ),
                        SegmentTab(label: "Zoom"),
                        SegmentTab(label: "Hand In"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                    ),
                    padding:
                        const EdgeInsets.only(top: 20, right: 30, left: 30),

                    height: 400, // Adjust the height as necessary
                    child: const TabBarView(
                      children: [
                        ///NeedToBeImpelemted
                        LecturesDetail(),
                        ZoomMeeting(),
                        HandInLecture(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        color: Theme.of(context).focusColor,
      ),
    );
  }
}

