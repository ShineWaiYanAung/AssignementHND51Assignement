import 'dart:ui';

import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/dash_board_screen.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/grades_status.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/profile_screen.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/school_intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainControlScreen extends StatefulWidget {
  MainControlScreen({super.key});

  @override
  State<MainControlScreen> createState() => _MainControlScreenState();
}

class _MainControlScreenState extends State<MainControlScreen> {
  List<IconData> navIcon = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.grade_outlined,
    Icons.import_contacts_outlined,
  ];

  int selectedIndex = 0;

  List<Widget> pages = [
    const DashBoardScreen(),
    const ProfileScreen(),
    const GradesStatus(),
    const SchoolIntro(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: pages[selectedIndex],
          ),
          Positioned(
            bottom: 60,
            right: 20,
            left: 20,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: navIcon.map(
                      (icon) {
                        int index = navIcon.indexOf(icon);
                        bool isSelected = selectedIndex == index;
                        return Container(
                          alignment: Alignment.center,
                          child: IconButton(
                              onPressed: () => setState(() {
                                    selectedIndex = index;
                                    if (kDebugMode) {
                                      print(selectedIndex);
                                    }
                                  }),
                              icon: Icon(
                                icon,
                                size: 35,
                                color: isSelected
                                    ? Theme.of(context).focusColor
                                    : Colors.black.withOpacity(0.5),
                              )),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
