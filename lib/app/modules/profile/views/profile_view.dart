import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/app/modules/profile/controllers/profile_controller.dart';

import '../../../routes/app_pages.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              profileHeader(),
              profileBody(context),
              logoutButton(),
              const SizedBox(height: 8)
            ],
          ),
        ),
      );

  Container logoutButton() => Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff3B3B98), Color(0xff0072B5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () => controller.logout(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 31.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Container profileBody(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: GoogleFonts.inter(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  profileTile(
                    const FaIcon(FontAwesomeIcons.users),
                    "My Batch",
                    () => Get.toNamed(Routes.MY_BATCH),
                  ),
                  const Divider(),
                  profileTile(
                    const FaIcon(FontAwesomeIcons.palette),
                    "Theme",
                    () => controller.toggleThemeMode(
                        context.isDarkMode ? ThemeMode.light : ThemeMode.dark),
                  ),
                  const Divider(),
                  profileTile(const FaIcon(FontAwesomeIcons.handHoldingHeart),
                      "Feedback", () {}),
                  const Divider(),
                  profileTile(const FaIcon(FontAwesomeIcons.thumbsUp),
                      "Rate Us", () {}),
                  const Divider(),
                  profileTile(
                      const FaIcon(FontAwesomeIcons.share), "Share", () {}),
                  const Divider(),
                  profileTile(const FaIcon(FontAwesomeIcons.info), "About", () {
                    Get.toNamed(Routes.ABOUT_PAGE);
                  }),
                  const Divider(),
                  profileTile(
                      const FaIcon(FontAwesomeIcons.share), "Create notice",
                      () {
                    Get.toNamed(Routes.CREATE_NOTICE);
                  }),
                ],
              ),
            ),
          ],
        ),
      );

  Container profileHeader() => Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff3B3B98), Color(0xff0072B5)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(500),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 10.0, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.transparent,
              child: Hero(
                tag: 'profile',
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: CachedNetworkImageProvider(
                    controller.authService.photoURL ?? "",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(controller.authService.displayName ?? "",
                style: GoogleFonts.roboto(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            Text(controller.authService.email ?? "",
                style: GoogleFonts.robotoMono(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
            const SizedBox(height: 20),
          ],
        ),
      );

  PreferredSize appBar() => PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff3B3B98), Color(0xff0072B5)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ));

  Widget profileTile(Widget icon, String text, [VoidCallback? onPressed]) =>
      ListTile(
        leading: icon,
        title: Text(text, style: Get.theme.textTheme.bodyLarge),
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.0),
        onTap: onPressed,
      );
}
