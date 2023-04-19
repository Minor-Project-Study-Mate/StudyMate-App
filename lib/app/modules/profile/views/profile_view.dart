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
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                    bottomLeft: Radius.circular(200)),
              ),
              padding: const EdgeInsets.only(bottom: 20.0, top: 20),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'xyz@gmail.com',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the next page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.users),
                              color: Colors.black,
                            ),
                            const Text(
                              'My Batch',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the next page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.palette),
                              color: Colors.black,
                            ),
                            const Text(
                              'Theme',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
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
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                  FontAwesomeIcons.handHoldingHeart),
                              color: Colors.black,
                            ),
                            const Text(
                              'Feedback',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
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
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.thumbsUp),
                              color: Colors.black,
                            ),
                            const Text(
                              'Rate Us',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
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
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.shareNodes),
                              color: Colors.black,
                            ),
                            const Text(
                              'Share this APP',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
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
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.circleInfo),
                              color: Colors.black,
                            ),
                            const Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the next page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 11.0, horizontal: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.powerOff),
                              color: Colors.black,
                            ),
                            const Text(
                              'Log Out',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19.0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Report a Problem',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
