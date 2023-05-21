import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  const CourseView({Key? key}) : super(key: key);

  static final folders = [
    "ML",
    "Android Development",
    "Flutter App Development",
    "Web Development",
    "Competitive Programming",
    "Data Structures and Algorithms",
    "Python",
    "Java",
    "C++",
    "C",
    "Javascript",
    "HTML",
    "CSS",
    "React",
    "Angular",
    "Node.js",
    "Django",
    "Flask",
    "Firebase",
    "MongoDB",
    "SQL",
    "NoSQL",
    "Machine Learning",
    "Deep Learning",
    "Artificial Intelligence",
    "Natural Language Processing",
    "Computer Vision",
    "Data Science",
    "Blockchain",
    "Cyber Security",
    "Ethical Hacking",
    "Internet of Things",
    "Cloud Computing",
    "DevOps",
    "Kubernetes",
    "Docker",
    "Linux",
    "Windows",
    "MacOS",
    "iOS Development",
    "Swift",
    "Kotlin",
    "Dart",
    "Rust",
    "Go",
    "R",
    "Ruby",
    "P"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(folders.length, (index) {
          return Card(
            child: Center(
              child: Text(
                folders[index],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
