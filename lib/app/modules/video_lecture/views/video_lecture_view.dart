
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/video_lecture_controller.dart';

// class VideoLectureView extends GetView<VideoLectureController> {
//   const VideoLectureView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('VideoLecture'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Text(
//             'DSA',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(
//             height: 150,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 String title;
//                 String imageUrl;

//                 if (index == 0) {
//                   title = 'Gate Smasher';
//                   imageUrl = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
//                 } else if (index == 1) {
//                   title = 'Coding Wizard';
//                   imageUrl = 'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
//                 } else {
//                   title = 'Algorithm Master';
//                   imageUrl = 'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
//                 }

//                 return buildListWidget(title, imageUrl);
//               },
//             ),
//           ),
//           const Text(
//             'OS',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(
//             height: 150,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 String title;
//                 String imageUrl;

//                 if (index == 0) {
//                   title = 'System Architect';
//                   imageUrl = 'https://example.com/os_image1.jpg';
//                 } else if (index == 1) {
//                   title = 'Process Management';
//                   imageUrl = 'https://example.com/os_image2.jpg';
//                 } else {
//                   title = 'Memory Management';
//                   imageUrl = 'https://example.com/os_image3.jpg';
//                 }

//                 return buildListWidget(title, imageUrl);
//               },
//             ),
//           ),
//           const Text(
//             'DBMS',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(
//             height: 150,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 String title;
//                 String imageUrl;

//                 if (index == 0) {
//                   title = 'Database Design';
//                   imageUrl = 'https://example.com/dbms_image1.jpg';
//                 } else if (index == 1) {
//                   title = 'SQL Mastery';
//                   imageUrl = 'https://example.com/dbms_image2.jpg';
//                 } else {
//                   title = 'Data Modeling';
//                   imageUrl = 'https://example.com/dbms_image3.jpg';
//                 }

//                 return buildListWidget(title, imageUrl);
//               },
//             ),
//           ),
//           const Text(
//             'CD',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(
//             height: 150,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 String title;
//                 String imageUrl;

//                 if (index == 0) {
//                   title = 'Digital Logic';
//                   imageUrl = 'https://example.com/cd_image1.jpg';
//                 } else if (index == 1) {
//                   title = 'Computer Organization';
//                   imageUrl = 'https://example.com/cd_image2.jpg';
//                 } else {
//                   title = 'Microprocessors';
//                   imageUrl = 'https://example.com/cd_image3.jpg';
//                 }

//                 return buildListWidget(title, imageUrl);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListWidget(String title, String imageUrl) {
//     return Container(
//       width: 150,
//       margin: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Image.network(
//               imageUrl,
//               width: 150,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             title,
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/video_lecture_controller.dart';

class VideoLectureView extends GetView<VideoLectureController> {
  const VideoLectureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoLecture'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'DSA',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  String title;
                  String imageUrl;

                  if (index == 0) {
                    title = 'Gate Smasher';
                    imageUrl = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else if (index == 1) {
                    title = 'Coding Wizard';
                    imageUrl = 'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else {
                    title = 'Algorithm Master';
                    imageUrl = 'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  }

                  return buildListWidget(title, imageUrl);
                },
              ),
            ),
            const Text(
              'OS',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  String title;
                  String imageUrl;

                  if (index == 0) {
                    title = 'Gate Smasher';
                    imageUrl = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

                  } else if (index == 1) {
                    title = 'Love Babbar';
                    imageUrl = 'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else {
                    title = 'Me';
                    imageUrl = 'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  }

                  return buildListWidget(title, imageUrl);
                },
              ),
            ),
            const Text(
              'DBMS',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  String title;
                  String imageUrl;

                  if (index == 0) {
                    title = 'Database Design';
                    imageUrl = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else if (index == 1) {
                    title = 'SQL Mastery';
                    imageUrl = 'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else {
                    title = 'Data Modeling';
                    imageUrl = 'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  }

                  return buildListWidget(title, imageUrl);
                },
              ),
            ),
            const Text(
              'CD',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  String title;
                  String imageUrl;

                  if (index == 0) {
                    title = 'Digital Logic';
                    imageUrl = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else if (index == 1) {
                    title = 'Gate Smasher';
                    imageUrl = 'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  } else {
                    title = 'Microprocessors';
                    imageUrl = 'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                  }

                  return buildListWidget(title, imageUrl);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListWidget(String title, String imageUrl) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
