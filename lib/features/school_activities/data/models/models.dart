import '../../domain/entites/entities.dart';

class CourseModel extends Course {
  const CourseModel(
      {required super.id,
      required super.courseName,
      required super.title,
      required super.lecturer,
      required super.lecturePic,
      required super.coursePic,
      required super.generalCourse,
      required super.lecture1,
      required super.lecture2,
      required super.lecture3,
      required super.grades
      });
  factory CourseModel.fromJson(Map<String, dynamic> map) {
    return CourseModel(
        id: map['id'],
        courseName: map['courseName'],
        title: map['title'],
        lecturer: map['lecturer'],
        lecturePic: map['lecturePic'],
        coursePic: map['coursePic'],
        generalCourse: map['generalCourse'],
        lecture1: map['lecture1'],
        lecture2: map['lecture2'],
        lecture3: map['lecture3'],
        grades: map['grades']);
  }
}
