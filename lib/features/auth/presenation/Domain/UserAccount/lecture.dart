
import 'package:hive/hive.dart';
part 'lecture.g.dart';
@HiveType(typeId: 2)
class Lecture{
  @HiveField(6)
  final String name;
  Lecture({required this.name});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Lecture && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => name;
}