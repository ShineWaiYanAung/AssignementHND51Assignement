import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/mainControlScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/dash_board_screen.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/grades_status.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/profile_screen.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/school_intro.dart';

void main() {
  testWidgets('MainControlScreen shows correct pages when icons are tapped', (WidgetTester tester) async {
    // Build the MainControlScreen widget
    await tester.pumpWidget(
      MaterialApp(
        home: MainControlScreen(),
      ),
    );

    // Verify that the initial page is the DashBoardScreen
    expect(find.byType(DashBoardScreen), findsOneWidget);

    // Find the Profile icon and tap it
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the ProfileScreen is displayed
    expect(find.byType(ProfileScreen), findsOneWidget);

    // Find the Grades icon and tap it
    await tester.tap(find.byIcon(Icons.grade_outlined));
    await tester.pumpAndSettle();

    // Verify that the GradesStatus screen is displayed
    expect(find.byType(GradesStatus), findsOneWidget);

    // Find the School Intro icon and tap it
    await tester.tap(find.byIcon(Icons.import_contacts_outlined));
    await tester.pumpAndSettle();

    // Verify that the SchoolIntro screen is displayed
    expect(find.byType(SchoolIntro), findsOneWidget);

    // Return to the DashBoardScreen
    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();

    // Verify that the DashBoardScreen is displayed again
    expect(find.byType(DashBoardScreen), findsOneWidget);
  });
}
