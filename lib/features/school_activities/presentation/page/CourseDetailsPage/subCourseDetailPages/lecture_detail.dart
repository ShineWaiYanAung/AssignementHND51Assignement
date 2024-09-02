import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/data/models/models.dart';

class LecturesDetail extends StatelessWidget {
  final CourseModel eachCourse;

  const LecturesDetail({super.key, required this.eachCourse});

  @override
  Widget build(BuildContext context) {
    final List<LectureInfo> lecturePaths = [
      if (eachCourse.generalCourse != null)
        LectureInfo(title: eachCourse.generalTitle, path: eachCourse.generalCourse!),
      if (eachCourse.lecture1 != null)
        LectureInfo(title: eachCourse.lecture1Title, path: eachCourse.lecture1!),
      if (eachCourse.lecture2 != null)
        LectureInfo(title: eachCourse.lecture2Title, path: eachCourse.lecture2!),
      if (eachCourse.lecture3 != null)
        LectureInfo(title: eachCourse.lecture3Title, path: eachCourse.lecture3!),
    ];

    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            color: Theme.of(context).primaryColor,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Lectures",
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                      fontFamily: 'SecondaryFont',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: lecturePaths.isEmpty
                ? Center(child: Text("No lectures available."))
                : ListView.builder(
              itemCount: lecturePaths.length,
              itemBuilder: (context, index) {
                final eachLecture = lecturePaths[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(eachLecture.title),
                      subtitle: const Text("HND-51"),
                      trailing: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).focusColor,
                          ),
                        ),
                        child: Text(
                          'Watch',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PDFViewerScreen(
                                title: eachLecture.title,
                                filePath: eachLecture.path,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String title;
  final String filePath;

  const PDFViewerScreen({
    super.key,
    required this.title,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SfPdfViewer.asset(filePath
      )
    );
  }
}

class LectureInfo {
  final String title;
  final String path;

  LectureInfo({required this.title, required this.path});
}
