import 'package:equatable/equatable.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object?> get props => [];
}

class LoadCourse extends CourseEvent {
  final int courseId;

  const LoadCourse(this.courseId);

  @override
  List<Object?> get props => [courseId];
}
