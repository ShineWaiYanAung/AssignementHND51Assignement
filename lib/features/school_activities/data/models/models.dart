import '../../domain/entites/entities.dart';

class CourseModel extends Course {
  final String generalTitle;
  final String lecture1Title;
  final String lecture2Title;
  final String lecture3Title;

  const CourseModel({
    required super.id,
    required super.courseName,
    required super.title,
    required super.lecturer,
    required super.lecturePic,
    required super.coursePic,
    required super.generalCourse,
    required super.lecture1,
    required super.lecture2,
    required super.lecture3,
    required super.grades,
    required this.lecture1Title,
    required this.lecture2Title,
    required this.lecture3Title,
    required this.generalTitle
  });

  factory CourseModel.fromJson(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] ?? 0,
      courseName: map['courseName'] ?? '',
      title: map['title'] ?? '',
      lecturer: map['lecturer'] ?? '',
      lecturePic: map['lecturePic'] ?? '',
      coursePic: map['coursePic'] ?? '',
      generalCourse: map['generalCourse'] ?? '',
      lecture1: map['lecture1'] ?? '',
      lecture2: map['lecture2'] ?? '',
      lecture3: map['lecture3'] ?? '',
      grades: map['grades'] ?? '',
      lecture1Title: map['lecture1-title'] ?? '',
      lecture2Title: map['lecture2-title'] ?? '',
      lecture3Title: map['lecture3-title'] ?? '',
      generalTitle: map['general-title'] ?? '',
    );
  }
}
