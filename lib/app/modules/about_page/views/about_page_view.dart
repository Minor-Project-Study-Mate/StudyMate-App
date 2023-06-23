
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/about_page_controller.dart';

class AboutPageView extends GetView<AboutPageController> {
  const AboutPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team Members',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              buildPersonCard(
                name: 'Alok Kumar',
                imageAsset: 'assets/images/alok.jpg',
                instagramLink: 'https://iinstagram.com/4_alokk',
                githubLink: 'https://github.com/4-alok',
                linkedinLink: 'https://www.linkedin.com/in/4-alok/',
                contactText: 'Mobile-7250723796',
              ),
              const SizedBox(height: 16.0),
              buildPersonCard(
                name: 'Nitin Kumar',
                imageAsset: 'assets/images/nitin.jpg',
                instagramLink: 'https://instagram.com/nitinkumargd?igshid=ZDdkNTZiNTM',
                githubLink: 'https://github.com/Nitin-45',
                linkedinLink: 'https://www.linkedin.com/in/nitin-kumar-4a07681b8/',
                contactText: 'Mobile-9523578653',
              ),
              const SizedBox(height: 16.0),
              buildPersonCard(
                name: 'Sneha Agarwal',
                imageAsset: 'assets/images/sneha.jpg',
                instagramLink: '',
                githubLink: 'https://github.com/Sneha280564',
                linkedinLink: 'https://www.linkedin.com/in/sneha-agarwal-sa19',
                contactText: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPersonCard({
    required String name,
    required String imageAsset,
    required String instagramLink,
    required String githubLink,
    required String linkedinLink,
    required String contactText,
  }) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageAsset),
            ),
            const SizedBox(height: 16.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLinkButton('Instagram', instagramLink),
                const SizedBox(width: 8.0),
                buildLinkButton('GitHub', githubLink),
                const SizedBox(width: 8.0),
                buildLinkButton('LinkedIn', linkedinLink),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(contactText),
          ],
        ),
      ),
    );
  }

  Widget buildLinkButton(String text, String link) {
    return ElevatedButton(
      onPressed: () {
        _launchURL(link);
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        textStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
