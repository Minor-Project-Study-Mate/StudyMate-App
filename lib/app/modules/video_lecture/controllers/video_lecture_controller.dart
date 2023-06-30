// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/firebase_service.dart';
import 'package:study_mate/app/services/firebase/model/lecture_model.dart';
import 'package:url_launcher/url_launcher.dart';

const dummyData = [
  {
    "name": "DSA",
    "description": "Data Structures and Algorithms",
    "playlists": [
      {
        "title": "Gate Smasher",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Coding Wizard",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Algo Expert",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "DBMS",
    "description": "Database Management System",
    "playlists": [
      {
        "title": "Gate Smasher",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Coding Wizard",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Algo Expert",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "OS",
    "description": "Operating System",
    "playlists": [
      {
        "title": "Gate Smasher",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Coding Wizard",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Algo Expert",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "CN",
    "description": "Computer Networks",
    "playlists": [
      {
        "title": "Gate Smasher",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Coding Wizard",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Algo Expert",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "COA",
    "description": "Computer Organization and Architecture",
    "playlists": [
      {
        "title": "Gate Smasher",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Coding Wizard",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Algo Expert",
        "url": "https://www.youtube.com/watch?v=1ZGJzvkcLsA",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  }
];

class VideoLectureController extends GetxController {
  Future<List<Subject>> getDemoLecture() async {
    // emulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // return dummy data
    return dummyData.map((e) => Subject.fromMap(e)).toList();
  }

  Future<List<Subject>> getLectures() async {
    final firebaseService = Get.find<FirebaseService>();
    return await firebaseService.lectureDatasourcese.getLectures();
  }

  Future<void> launchURL(String url) async => (await canLaunch(url))
      ? await launch(url)
      : Get.snackbar("Error", "Could not launch $url");
}
