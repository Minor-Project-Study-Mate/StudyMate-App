// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/firebase_service.dart';
import 'package:study_mate/app/services/firebase/model/lecture_model.dart';
import 'package:study_mate/credential.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

const dummyData = [
  {
    "name": "DSA",
    "description": "Data Structures and Algorithms",
    "playlists": [
      {
        "title": "Gate Smashers",
        "url":
            "https://www.youtube.com/playlist?list=PLxCzCOWd7aiEwaANNt3OqJPVIxwp2ebiT",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://img.youtube.com/vi/Pn9SXXVqDQU/sddefault.jpg"
      },
      {
        "title": "CodeWithHarry",
        "url":
            "https://www.youtube.com/playlist?list=PLu0W_9lII9ahIappRPN0MCAgtOu3lQjQi",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Abdul Bari",
        "url":
            "https://www.youtube.com/playlist?list=PLfqBHhcvlW7-SOGCl7TJxZ4426qBCmCpc",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "DAA",
    "description": "Data Analysis and Algorithms",
    "playlists": [
      {
        "title": "Gate Smashers",
        "url":
            "https://www.youtube.com/playlist?list=PLxCzCOWd7aiHcmS4i14bI0VrMbZTUvlTa",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/3cU__spdMIw/maxresdefault.jpg"
      },
      {
        "title": "Education 4u",
        "url":
            "https://www.youtube.com/playlist?list=PLrjkTql3jnm8wGQyNhgdmm2gkoa8CXCml",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Abdul Bari",
        "url":
            "https://www.youtube.com/playlist?list=PLDN4rrl48XKpZkf03iYFl-O29szjTrs_O",
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
        "title": "Gate Smashers",
        "url":
            "https://www.youtube.com/playlist?list=PLxCzCOWd7aiFAN6I8CuViBuCdJgiOkT2Y",
        "description": "Gate Smashers",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Jenny's Lectures",
        "url":
            "https://www.youtube.com/playlist?list=PLdo5W4Nhv31b33kF46f9aFjoJPOkdlsRc",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Knowledge Gate",
        "url":
            "https://www.youtube.com/playlist?list=PLmXKhU9FNesR1rSES7oLdJaNFgmuj0SYV",
        "description": "Knowledge Gate",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "OS",
    "description": "Operating System",
    "playlists": [
      {
        "title": "Gate Smashers",
        "url":
            "https://www.youtube.com/playlist?list=PLxCzCOWd7aiGz9donHRrE9I3Mwn6XdP8p",
        "description": "Gate Smashers",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Jenny's Lectures",
        "url":
            "https://www.youtube.com/playlist?list=PLdo5W4Nhv31a5ucW_S1K3-x6ztBRD-PNa",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "5 Minutes Engineering",
        "url":
            "https://www.youtube.com/playlist?list=PLYwpaL_SFmcD0LLrv7CXxSiO2gNJsoxpi",
        "description": "5 Minutes Engineering",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "CN",
    "description": "Computer Networks",
    "playlists": [
      {
        "title": "Gate Smashers",
        "url":
            "https://www.youtube.com/playlist?list=PLxCzCOWd7aiGFBD2-2joCpWOLUrDLvVV_",
        "description": "Gate Smashers",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Jyotiprakash Mishra CS",
        "url":
            "https://www.youtube.com/playlist?list=PL_SV5hQjReiWVPV8QdmD2G-x3Om1rATVV",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "5 Minutes Engineering",
        "url":
            "https://www.youtube.com/playlist?list=PLYwpaL_SFmcAXkWn2IR-l_WXOrr0n851a",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "COA",
    "description": "Computer Organization and Architecture",
    "playlists": [
      {
        "title": "Gate Smashers",
        "url":
            "https://www.youtube.com/playlist?list=PLxCzCOWd7aiHMonh3G6QNKq53C6oNXGrX",
        "description": "Gate Smashers",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Education 4u",
        "url":
            "https://www.youtube.com/playlist?list=PLrjkTql3jnm8AcFgkc5TE_yQgeHEuKYrG",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "Easy Engineering Classest",
        "url":
            "https://www.youtube.com/playlist?list=PLV8vIYTIdSnar4uzz-4TIlgyFJ2m18NE3",
        "description": "Easy Engineering Classes",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
  {
    "name": "OOP",
    "description": "Object Oriented Programming",
    "playlists": [
      {
        "title": "Education 4u",
        "url":
            "https://www.youtube.com/playlist?list=PLrjkTql3jnm-Voi7giH4JITCi6cuZSN42",
        "description": "Education 4u",
        "thumbnailUrl": "https://i.ytimg.com/vi/3cU__spdMIw/maxresdefault.jpg"
      },
      {
        "title": "Kunal Kushwaha",
        "url":
            "https://www.youtube.com/playlist?list=PL9gnSGHSqcno1G3XjUbwzXHL8_EttOuKk",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      },
      {
        "title": "College Wallah",
        "url":
            "https://www.youtube.com/watch?v=bL-o2xBENY0&list=PLxgZQoSe9cg0df_GxVjz3DD_Gck5tMXAd",
        "description": "Gate Smasher",
        "thumbnailUrl": "https://i.ytimg.com/vi/1ZGJzvkcLsA/maxresdefault.jpg"
      }
    ]
  },
];

class VideoLectureController extends GetxController {
  /// The function `getDemoLecture` returns a Future that resolves to a list of Subject objects after
  /// emulating a network delay and mapping dummy data.
  ///
  /// Returns:
  ///   a Future object that resolves to a List of Subject objects.
  Future<List<Subject>> getDemoLecture() async {
    // emulate network delay
    //await Future.delayed(const Duration(seconds: 1));

    // return dummy data
    return dummyData.map((e) => Subject.fromMap(e)).toList();
  }

  /// The function `getLectures` retrieves a list of subjects asynchronously from a Firebase service.
  ///
  /// Returns:
  ///   a `Future` object that resolves to a `List` of `Subject` objects.
  Future<List<Subject>> getLectures() async {
    final firebaseService = Get.find<FirebaseService>();
    return await firebaseService.lectureDatasourcese.getLectures();
  }

  Future<void> launchURL(String url) async => (await canLaunch(url))
      ? await launch(url)
      : Get.snackbar("Error", "Could not launch $url");

  Future<String> getPlaylistThumbnail(String playlistLink) async {
    final playlistId = playlistLink.split('list=')[1];
    final apiUrl =
        'https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=$playlistId&key=$API_KEY';
    final response = await http.get(Uri.parse(apiUrl));
    final data = jsonDecode(response.body);
    return data['items'][0]['snippet']['thumbnails']['high']['url'];
  }
}
