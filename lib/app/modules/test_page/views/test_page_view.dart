import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/test_page_controller.dart';

class TestPageView extends GetView<TestPageController> {
  const TestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('TestPage'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            authWidget(context),
            const SizedBox(height: 20),
            themeWidget(context),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Firebase Test",
                      style: Get.theme.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.createEvent();
                          },
                          child: const Text("Add Event"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.readEvent();
                          },
                          child: const Text("Read Event"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget themeWidget(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "ThemeMode Test",
                style: Get.theme.textTheme.labelLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.toggleThemeMode(
                      context.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                    ),
                    child: const Text("Toggle Theme"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget authWidget(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Auth Test",
                style: Get.theme.textTheme.labelLarge,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userName,
                            style: Get.theme.textTheme.headlineLarge,
                          ),
                          Text(
                            controller.userEmail,
                            style: Get.theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.googleSignIn(),
                    child: const Text("Google Login"),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => controller.logout(),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[100]),
                    ),
                    child: const Text("Logout"),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => controller.printUser(),
                    child: const Text("Print User"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
