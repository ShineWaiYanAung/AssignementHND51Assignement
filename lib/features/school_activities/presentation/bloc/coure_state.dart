import 'package:equatable/equatable.dart';
import '../../data/models/models.dart';


abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final CourseModel course;

  const CourseLoaded(this.course);

  @override
  List<Object?> get props => [course];
}

class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object?> get props => [message];
}
