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
      },
      {
        "title": "Jenny Lecture",
        "url":
            "https://youtube.com/playlist?list=PLdo5W4Nhv31bbKJzrsKfMpo_grxuLl8LU",
        "description": "Jenny Lecture",
      },
      {
        "title": "Code Help",
        "url":
            "https://youtube.com/playlist?list=PLDzeHZWIZsTryvtXdMr6rPh4IDexB5NIA",
        "description": "Code Help",
      },
      {
        "title": "Apna College",
        "url":
            "https://youtube.com/playlist?list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ",
        "description": "Apna College",
      },
      {
        "title": "CodeWithHarry",
        "url":
            "https://www.youtube.com/playlist?list=PLu0W_9lII9ahIappRPN0MCAgtOu3lQjQi",
      },
      {
        "title": "Abdul Bari",
        "url":
            "https://www.youtube.com/playlist?list=PLfqBHhcvlW7-SOGCl7TJxZ4426qBCmCpc",
        "description": "Gate Smasher",
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
      },
      {
        "title": "Education 4u",
        "url":
            "https://www.youtube.com/playlist?list=PLrjkTql3jnm8wGQyNhgdmm2gkoa8CXCml",
      },
      {
        "title": "University Academy",
        "url":
            "https://youtube.com/playlist?list=PL-JvKqQx2Atd--1Gs3WB8nmWOWRbEM7WW",
      },
      {
        "title": "GRS",
        "url":
            "https://youtube.com/playlist?list=PLtg1mdkLERgnS8XNGU4irXk7dRuji61ZX",
      },
      {
        "title": "GateHub",
        "url":
            "https://youtube.com/playlist?list=PL1QH9gyQXfgs7foRxIbIH8wmJyDh5QzAm",
      },
      {
        "title": "Abdul Bari",
        "url":
            "https://www.youtube.com/playlist?list=PLDN4rrl48XKpZkf03iYFl-O29szjTrs_O",
        "description": "Gate Smasher",
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
      },
      {
        "title": "Jenny's Lectures",
        "url":
            "https://www.youtube.com/playlist?list=PLdo5W4Nhv31b33kF46f9aFjoJPOkdlsRc",
      },
      {
        "title": "Code help",
        "url":
            "https://youtube.com/playlist?list=PLDzeHZWIZsTpukecmA2p5rhHM14bl2dHU",
      },
      {
        "title": "Unacademy",
        "url":
            "https://youtube.com/playlist?list=PLG9aCp4uE-s0bu-I8fgDXXhVLO4qVROGy",
      },
      {
        "title": "Amit Khurana",
        "url":
            "https://youtube.com/playlist?list=PLC36xJgs4dxGcz7nZaxGxxmbJrcgDXhFk",
      },
      {
        "title": "Knowledge Gate",
        "url":
            "https://www.youtube.com/playlist?list=PLmXKhU9FNesR1rSES7oLdJaNFgmuj0SYV",
        "description": "Knowledge Gate",
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
      },
      {
        "title": "Jenny's Lectures",
        "url":
            "https://www.youtube.com/playlist?list=PLdo5W4Nhv31a5ucW_S1K3-x6ztBRD-PNa",
      },
      {
        "title": "Unacademy",
        "url":
            "https://youtube.com/playlist?list=PLG9aCp4uE-s17rFjWM8KchGlffXgOzzVP",
      },
      {
        "title": "Code Help",
        "url":
            "https://youtube.com/playlist?list=PLDzeHZWIZsTr3nwuTegHLa2qlI81QweYG",
      },
      {
        "title": "Neso Academy",
        "url":
            "https://youtube.com/playlist?list=PLBlnK6fEyqRiVhbXDGLXDk_OQAeuVcp2O",
      },
      {
        "title": "5 Minutes Engineering",
        "url":
            "https://www.youtube.com/playlist?list=PLYwpaL_SFmcD0LLrv7CXxSiO2gNJsoxpi",
        "description": "5 Minutes Engineering",
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
      },
      {
        "title": "Neso Academy",
        "url":
            "https://youtube.com/playlist?list=PLBlnK6fEyqRgMCUAG0XRw78UA8qnv6jEx",
      },
      {
        "title": "Jyotiprakash Mishra CS",
        "url":
            "https://www.youtube.com/playlist?list=PL_SV5hQjReiWVPV8QdmD2G-x3Om1rATVV",
      },
      {
        "title": "5 Minutes Engineering",
        "url":
            "https://www.youtube.com/playlist?list=PLYwpaL_SFmcAXkWn2IR-l_WXOrr0n851a",
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
      },
      {
        "title": "Education 4u",
        "url":
            "https://www.youtube.com/playlist?list=PLrjkTql3jnm8AcFgkc5TE_yQgeHEuKYrG",
      },
      {
        "title": "Easy Engineering Classest",
        "url":
            "https://www.youtube.com/playlist?list=PLV8vIYTIdSnar4uzz-4TIlgyFJ2m18NE3",
        "description": "Easy Engineering Classes",
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
      },
      {
        "title": "Kunal Kushwaha",
        "url":
            "https://www.youtube.com/playlist?list=PL9gnSGHSqcno1G3XjUbwzXHL8_EttOuKk",
        "description": "Gate Smasher",
      },
      {
        "title": "College Wallah",
        "url":
            "https://www.youtube.com/watch?v=bL-o2xBENY0&list=PLxgZQoSe9cg0df_GxVjz3DD_Gck5tMXAd",
        "description": "Gate Smasher",
      }
    ]
  },
  {
    "name": "HPC",
    "description": "High Performance and Compuing",
    "playlists": [
      {
        "title": "Nitjsr",
        "url":
            "https://youtube.com/playlist?list=PLKbHXY2AAg7Vn2_om3WhIG_pohRJRTSok",
        "description": "Nitjsr",
      },
      {
        "title": "Nptel",
        "url": "https://youtube.com/playlist?list=PL2F82ECDF8BB71B0C",
        "description": "Nptel",
      },
      {
        "title": "Shannu Kuttan",
        "url":
            "https://youtube.com/playlist?list=PL3R9-um41Jsz4as9nqgVB6YRR90rs0wE6",
        "description": "Shannu Kuttan",
      }
    ]
  },
  {
    "name": "CD",
    "description": "Compiler and Design",
    "playlists": [
      {
        "title": "Gate Smasher",
        "url":
            "https://youtube.com/playlist?list=PLxCzCOWd7aiEKtKSIHYusizkESC42diyc",
      },
      {
        "title": "Lalit Vashishtha",
        "url":
            "https://youtube.com/playlist?list=PLLvKknWU7N4zpJWLqk7DXK26JwTB-gFmZ",
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

  Future<String> getPlaylistThumbnail(String url) async {
    if (url.contains('list')) {
      final playlistId = url.split('list=')[1];
      final apiUrl =
          'https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=$playlistId&key=$API_KEY';
      final response = await http.get(Uri.parse(apiUrl));
      final data = jsonDecode(response.body);
      return data['items'][0]['snippet']['thumbnails']['high']['url'];
    } else if (url.contains('watch')) {
      final videoId = url.split('v=')[1];
      final apiUrl =
          'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$videoId&key=$API_KEY';
      final response = await http.get(Uri.parse(apiUrl));
      final data = jsonDecode(response.body);
      return data['items'][0]['snippet']['thumbnails']['high']['url'];
    } else {
      return "";
    }
  }
}
