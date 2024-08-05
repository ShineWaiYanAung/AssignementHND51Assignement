import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int id;
  final String courseName;
  final String title;
  final String lecturer;
  final String lecturePic;
  final String coursePic;
  final String generalCourse;
  final String lecture1;
  final String lecture2;
  final String lecture3;
  final String grades;

  const Course({
    required this.id,
    required this.courseName,
    required this.title,
    required this.lecturer,
    required this.lecturePic,
    required this.coursePic,
    required this.generalCourse,
    required this.lecture1,
    required this.lecture2,
    required this.lecture3,
    required this.grades,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        courseName,
        title,
        lecturer,
        lecturePic,
        coursePic,
        generalCourse,
        lecture1,
        lecture2,
        lecture3,
        grades,
      ];
}
