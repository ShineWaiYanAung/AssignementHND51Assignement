import 'dart:convert'; // For JSON decoding
import 'package:flutter/services.dart' show rootBundle;
import '../models/models.dart'; // For loading local JSON files

class CourseRepository {
  Future<List<CourseModel>> fetchCourses() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      final jsonString = await rootBundle.loadString('jsonDataApp/jsonData.json');
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
      final List<dynamic> coursesJson = jsonResponse['courses'];

      return coursesJson.map((data) => CourseModel.fromJson(data)).toList();
    } catch (e) {
      // Handle or log the error here
      print('Error loading courses: $e');
      return []; // Return an empty list or handle the error as needed
    }
  }

  Future<CourseModel> fetchCourseById(int id) async {
    try {
      final courses = await fetchCourses();
      return courses.firstWhere((course) => course.id == id);
    } catch (e) {
      print('Error fetching course by ID: $e');
      throw Exception('Course not found'); // Throw or handle as appropriate
    }
  }
}
