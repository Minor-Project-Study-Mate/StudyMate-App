import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:study_mate/app/modules/profile/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
            Text(
              'NITIN',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'nitinkumargd@gmail.com',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 200.0),
            Text(
              '',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '200',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '150',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Edit Profile'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
