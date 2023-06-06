import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_mate/app/modules/home/controllers/home_controller.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/firebase/model/notice_modal.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  HomeController get controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => AnimatedSize(
    duration: const Duration(milliseconds: 300),
    child: SizedBox(
      width: Get.width,
      child: FutureBuilder<List<Event>>(
          future: controller.getEventList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            } else if (snapshot.hasData) {
              final data = snapshot.data ?? [];
              return Column(mainAxisSize: MainAxisSize.min, children: [
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
                (data.isEmpty)
                    ? const Center(child: Text("No Events"))
                    : const SizedBox(),
                LayoutBuilder(
                    builder: (context, constraints) => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
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
                          itemBuilder: (context, index) =>
                              noticeItem(context, data[index]),
                        )),
              ]);
            } else {
              return const Center(child: Text("No Data"));
            }
          }),
    ),
  );

  Widget noticeItem(BuildContext context, Event event) => GestureDetector(
        onTap: () => Get.toNamed(Routes.NOTICE_PAGE, arguments: event),
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
                event.title,
                style: GoogleFonts.philosopher(
                    fontSize: 20.0,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                event.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      );
}
