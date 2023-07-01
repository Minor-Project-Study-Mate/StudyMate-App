import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../services/firebase/model/notice_modal.dart';
import '../controllers/event_page_controller.dart';

class EventPageView extends GetView<EventPageController> {
  const EventPageView({Key? key}) : super(key: key);

  Event get event => Get.arguments as Event;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    event.title,
                    style: GoogleFonts.goldman(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: event.thumbnailUrl == null
                      ? null
                      : CachedNetworkImage(imageUrl: event.thumbnailUrl!)),
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
                        event.description,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Date: ${DateFormat('d MMMM y').format(event.dateTime)}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Time: ${DateFormat('h:mm a').format(event.dateTime)}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    if (event.url != null)
                      InkWell(
                        onTap: () {},
                        child: Text(
                          event.url!,
                          style: const TextStyle(
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
