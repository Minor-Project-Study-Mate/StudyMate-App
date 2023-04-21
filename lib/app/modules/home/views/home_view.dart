import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:study_mate/app/routes/app_pages.dart';
import 'package:study_mate/app/services/auth/auth_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.PROFILE),
            icon: const FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.INTRO),
              child: const Text('Intro button'),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await Get.find<AuthServices>().googleUserInfo();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(res)));
              },
              child: const Text('Test'),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await Get.find<AuthServices>().printIsSignIn();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(res.toString())));
              },
              child: const Text('Is Signin'),
            )
          ],
        ),

        // child: Text(
        //   'HomeView is working',
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
    );
  }
}
