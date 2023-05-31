import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/app/modules/home/views/pages/fav.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'pages/resources.dart';

const headerHight = 200.0;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(children: [
          ListView(
            padding: const EdgeInsets.only(top: headerHight),
            children: [
              const SizedBox(height: 20.0),
              appFeatures(context),
              const SizedBox(height: 20.0),
              noticeEventWidget(context),
            ],
          ),
          bodyHeader(context),
        ]),
      );

  Widget noticeEventWidget(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Notice/Events",
              style: GoogleFonts.openSans(
                  fontSize: 35.0,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10.0),
          LayoutBuilder(
              builder: (context, constraints) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: constraints.maxWidth > 1000
                          ? Get.width * 2 / (Get.height)
                          : constraints.maxWidth > 600
                              ? Get.width * 3 / (Get.height)
                              : Get.width * 6 / (Get.height),
                      crossAxisCount: constraints.maxWidth > 1000
                          ? 3
                          : constraints.maxWidth > 600
                              ? 2
                              : 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) => noticeItem(context, index),
                  )),
        ],
      );

  Widget noticeItem(BuildContext context, int index) => GestureDetector(
        onTap: () => Get.toNamed(Routes.NOTICE_PAGE),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.grey.shade900
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notice ${index + 1}",
                style: GoogleFonts.philosopher(
                    fontSize: 20.0,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                "This is the content of Notice ${index + 1}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      );

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
                onPressed: () {},
                iconData: Icons.assignment,
                label: "Courses",
                color: Colors.green),
            _buildCircularButton(context,
                onPressed: () {},
                iconData: Icons.favorite,
                label: "MeetUp",
                color: Colors.red),
            _buildCircularButton(context,
                onPressed: () {},
                iconData: Icons.event,
                label: "Timetable",
                color: Colors.blue),
            _buildCircularButton(context,
                onPressed: () => Get.to(() => const FavBody()),
                iconData: Icons.star_border_outlined,
                label: "Favourites",
                color: Colors.purple.shade300),
            _buildCircularButton(context,
                onPressed: () {},
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
                 height: MediaQueryData.fromWindow(window).padding.top,),
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
