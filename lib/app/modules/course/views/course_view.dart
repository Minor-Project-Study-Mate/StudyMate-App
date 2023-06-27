//   static final folders = [
//     "ML",
//     "Android Development",
//     "Flutter App Development",
//     "Web Development",
//     "Competitive Programming",
//     "Data Structures and Algorithms",
//     "Python",
//     "Java",
//     "C++",
//     "C",
//     "Javascript",
//     "HTML",
//     "CSS",
//     "React",
//     "Angular",
//     "Node.js",
//     "Django",
//     "Flask",
//     "Firebase",
//     "MongoDB",
//     "SQL",
//     "NoSQL",
//     "Machine Learning",
//     "Deep Learning",
//     "Artificial Intelligence",
//     "Natural Language Processing",
//     "Computer Vision",
//     "Data Science",
//     "Blockchain",
//     "Cyber Security",
//     "Ethical Hacking",
//     "Internet of Things",
//     "Cloud Computing",
//     "DevOps",
//     "Kubernetes",
//     "Docker",
//     "Linux",
//     "Windows",
//     "MacOS",
//     "iOS Development",
//     "Swift",
//     "Kotlin",
//     "Dart",
//     "Rust",
//     "Go",
//     "R",
//     "Ruby",
//     "P",
//   ];

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/course_controller.dart';

class CourseView extends GetView<CourseController> {
  static final categories = [
    "UI/UX",
    "Coding",
    "App Design",
    "Basics",
  ];

  static final folders = [
    {
      "name": "ML",
      "image": "assets/images/ml_image.png",
      "color": Colors.redAccent,
    },
    {
      "name": "Android Development",
      "image": "assets/images/android_image.png",
      "color": Colors.blueAccent,
    },
    {
      "name": "Web Development",
      "image": "assets/images/web_image.jpg",
      "color": Colors.greenAccent,
    },
    {
      "name": "Flutter",
      "image": "assets/images/flutter_image.jpg",
      "color": Colors.orangeAccent,
    },
    {
      "name": "Python",
      "image": "assets/images/python_image.jpg",
      "color": const Color.fromARGB(255, 91, 5, 106),
    },
    {
      "name": "Java",
      "image": "assets/images/java_image.jpg",
      "color": Colors.yellowAccent,
    },
    {
      "name": "C++",
      "image": "assets/images/cpp_image.jpg",
      "color": Colors.pinkAccent,
    },
    {
      "name": "C",
      "image": "assets/images/c_image.jpg",
      "color": Colors.purpleAccent,
    },
    {
      "name": "Javascript",
      "image": "assets/images/js_image.jpg",
      "color": Colors.lightBlueAccent,
    },
    {
      "name": "HTML",
      "image": "assets/images/html_image.jpg",
      "color": Color.fromARGB(255, 12, 207, 139),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Courses",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Choose Your",
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          Text(
                            "Desired Course",
                            style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFF8FAFB),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Text(
                //     "Category",
                //     style: TextStyle(
                //       fontSize: 22,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 15),
                // SizedBox(
                //   height: 42,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: categories.length,
                //     shrinkWrap: true,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         margin: EdgeInsets.only(left: 20),
                //         padding: EdgeInsets.symmetric(horizontal: 25),
                //         decoration: BoxDecoration(
                //           color: index == 0 ? Colors.blue : null,
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(
                //             color: Colors.blue,
                //           ),
                //         ),
                //         child: Center(
                //           child: Text(
                //             categories[index],
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //               color: index == 0 ? Colors.white : Colors.blue,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                SizedBox(height: 15),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 310,
                  ),
                  itemCount: folders.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle tapping on a course
                        // Navigate to the course page
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.black),
                          color: folders[index]['color'] as Color?,
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                                child: Image.asset(
                                  folders[index]['image'] as String,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              left: 8.0,
                              right: 8.0,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      folders[index]['name'] as String,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              side: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: Text(
                                            'Go to Course',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
