import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/modules/profile/controllers/profile_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(
                Get.theme.brightness == Brightness.dark
                    ? ThemeData.light()
                    : ThemeData.dark(),
              );
            },
            icon: const Icon(Icons.sunny),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0, top: 20),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            const Text(
              'NITIN',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'nitinkumargd@gmail.com',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              //height: Get.height * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  const SizedBox(height: 10.0),
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.users),
                                color: Colors.white,
                              ),
                              Text(
                                'My Batch',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.palette),
                                color: Colors.white,
                              ),
                              Text(
                                'Theme',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.handHoldingHeart),
                                color: Colors.white,
                              ),
                              Text(
                                'Feedback',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.thumbsUp),
                                color: Colors.white,
                              ),
                              Text(
                                'Rate Us',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.shareNodes),
                                color: Colors.white,
                              ),
                              Text(
                                'Share this APP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.circleInfo),
                                color: Colors.white,
                              ),
                              Text(
                                'About Us',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.0, horizontal: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.powerOff),
                                color: Colors.white,
                              ),
                              Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 1.0,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement your functionality when the "Report a Problem" text is tapped
                    },
                    child: Text(
                      'Report a Problem',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
