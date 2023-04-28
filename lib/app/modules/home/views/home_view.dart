import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3B3B98), Color(0xff0072B5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi ${controller.getFirstName}",
                      style: GoogleFonts.exo(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.PROFILE),
                      child: SizedBox(
                        width: 60.0,
                        child: Hero(
                          tag: "profile",
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: CachedNetworkImageProvider(
                              controller.boxService.appUserBox.appUser
                                      ?.photoURL ??
                                  "",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 380.0,
                height: 50.0,
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        const SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCircularButton(
                FontAwesomeIcons.bookOpen, "Resources", Colors.pink.shade300),
            _buildCircularButton(Icons.assignment, "Courses", Colors.green),
            _buildCircularButton(Icons.favorite, "MeetUp", Colors.red),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCircularButton(Icons.event, "Timetable", Colors.blue),
            _buildCircularButton(Icons.star_border_outlined, "Favourites",
                Colors.purple.shade300),
            _buildCircularButton(
                Icons.video_camera_front_rounded, "Lectures", Colors.amber.shade400),
          ],
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Notice/Events",
            style: GoogleFonts.openSans(
                fontSize: 35.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notice ${index + 1}",
                      style: GoogleFonts.philosopher(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "This is the content of Notice ${index + 1}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }

  Widget _buildCircularButton(IconData iconData, String label, Color color) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // TODO: Implement button functionality
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: color,
            elevation: 5,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 40.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          label,
          // style: const TextStyle(fontSize: 16.0),
          style: GoogleFonts.philosopher(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
