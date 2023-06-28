import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as chrometab;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/app/modules/home/views/pages/fav.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'pages/resources.dart';
import 'widgets/event_list.dart';

const headerHight = 200.0;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Future<void> prevWeb(BuildContext context, String url) async {
    try {
      await chrometab.launch(
        url,
        customTabsOption: chrometab.CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(children: [
          ListView(
            padding: const EdgeInsets.only(top: headerHight),
            children: [
              const SizedBox(height: 20.0),
              appFeatures(context),
              const SizedBox(height: 20.0),
              const EventList(),
            ],
          ),
          bodyHeader(context),
        ]),
      );

  // Widget noticeEventWidget(BuildContext context) =>

  Widget appFeatures(BuildContext context) => AnimatedSize(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 40,
          children: [
            _buildCircularButton(context,
                onPressed: () => Get.to(() => ResourcesBody(controller)),
                iconData: FontAwesomeIcons.bookOpen,
                label: "Resources",
                color: Colors.pink.shade300),
            _buildCircularButton(context,
                onPressed: () => Get.toNamed(Routes.COURSE),
                iconData: Icons.assignment,
                label: "Courses",
                color: Colors.green),
            _buildCircularButton(context,
                onPressed: () {},
                iconData: Icons.favorite,
                label: "MeetUp",
                color: Colors.red),
            _buildCircularButton(context,
                onPressed: () =>
                    prevWeb(context, "https://kiitportal.kiituniversity.net/"),
                iconData: Icons.event,
                label: "SAP",
                color: Colors.blue),
            _buildCircularButton(context,
                onPressed: () => Get.to(() => const FavBody()),
                iconData: Icons.star_border_outlined,
                label: "Favourites",
                color: Colors.purple.shade300),
            _buildCircularButton(context, onPressed: () {
              Get.toNamed(Routes.VIDEO_LECTURE);
            },
                iconData: Icons.video_camera_front_rounded,
                label: "Lectures",
                color: Colors.amber.shade400),
          ],
        ),
      );

  Container bodyHeader(BuildContext context) => Container(
        height: headerHight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff3B3B98), Color(0xff0072B5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQueryData.fromWindow(window).padding.top,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hey Mate",
                    // "Hi ${controller.getFirstName}",
                    style: GoogleFonts.exo(
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                    child: SizedBox(
                      width: 60.0,
                      child: Hero(
                        tag: "profile",
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            controller.authService.photoURL ?? "",
                            maxHeight: 80,
                            maxWidth: 80,
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
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.0)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      );

  Widget _buildCircularButton(BuildContext context,
          {required IconData iconData,
          required String label,
          required Color color,
          VoidCallback? onPressed}) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
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
              style: GoogleFonts.philosopher(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
