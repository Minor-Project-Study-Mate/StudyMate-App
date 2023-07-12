// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/about_page_controller.dart';

class AboutPageView extends GetView<AboutPageController> {
  const AboutPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Team Members',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: ListView(
              padding: const EdgeInsets.all(7.0),
              children: [
                buildPersonCard(
                  name: 'Alok Kumar',
                  imageNetwork: 'https://i.imgur.com/2lnDRzns.jpg',
                  instagramLink: 'https://instagram.com/4_alokk',
                  githubLink: 'https://github.com/4-alok',
                  linkedinLink: 'https://www.linkedin.com/in/4-alok/',
                  contactText: 'Mobile-7250723796',
                ),
                const SizedBox(height: 16.0),
                buildPersonCard(
                  name: 'Nitin Kumar',
                  imageNetwork: 'https://i.imgur.com/cEFRGYqs.jpg',
                  instagramLink:
                      'https://instagram.com/nitinkumargd?igshid=ZDdkNTZiNTM',
                  githubLink: 'https://github.com/Nitin-45',
                  linkedinLink:
                      'https://www.linkedin.com/in/nitin-kumar-4a07681b8/',
                  contactText: 'Mobile-9523578653',
                ),
                const SizedBox(height: 16.0),
                buildPersonCard(
                  name: 'Sneha Agarwal',
                  imageNetwork: 'https://i.imgur.com/UPXcdqps.jpg',
                  instagramLink: '',
                  githubLink: 'https://github.com/Sneha280564',
                  linkedinLink:
                      'https://www.linkedin.com/in/sneha-agarwal-sa19',
                  contactText: '',
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildPersonCard({
    required String name,
    required String imageNetwork,
    required String instagramLink,
    required String githubLink,
    required String linkedinLink,
    required String contactText,
  }) =>
      Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageNetwork),
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

  Widget buildLinkButton(String text, String link) => ElevatedButton(
        onPressed: () {
          _launchURL(link);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: const TextStyle(color: Colors.white),
        ),
        child: Text(text),
      );

  void _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
