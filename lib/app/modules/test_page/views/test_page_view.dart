import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  Obx(() => AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: CachedNetworkImage(
                            imageUrl: controller.appUser.value?.photoURL ?? "",
                            placeholder: (context, url) =>
                                const FaIcon(FontAwesomeIcons.userCircle),
                            errorWidget: (context, url, error) {
                              print(error);
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                      )),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.appUser.value?.displayName ?? "Null",
                            style: Get.theme.textTheme.headlineLarge,
                          ),
                          Text(
                            controller.appUser.value?.email ?? "Null",
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
                ],
              ),
            ],
          ),
        ),
      );
}
