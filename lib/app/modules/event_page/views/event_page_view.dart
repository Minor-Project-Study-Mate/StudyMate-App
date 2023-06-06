import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/event_page_controller.dart';

class EventPageView extends GetView<EventPageController> {
  const EventPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'TITLE',
                style: GoogleFonts.goldman(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              background: Image.network(
                'https://avatars.githubusercontent.com/u/87150492?v=4',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Important Notice',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'The name Nitin is derived from the Sanskrit language, which is an ancient language of India. The word "Nitin" is a combination of two Sanskrit words: "ni" and "tina". "Ni" means "without" or "not", while "tina" means "polluted" or "dirty". Therefore, the word "Nitin" means "not polluted" or clean, pure.',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Date: 30th April 2023',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Time: 9:14 pm',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  InkWell(
                    onTap: () {
                      // Perform action when URL is tapped
                    },
                    child: const Text(
                      'www.nitin.com',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}
