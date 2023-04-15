import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/modules/profile/controllers/profile_controller.dart';

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
      body: Center(
        child: Column(
          children: <Widget>[
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
            const SizedBox(height: 200.0),
            const Text(
              '',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '200',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '150',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Edit Profile'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
