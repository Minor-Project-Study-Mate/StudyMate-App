import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as chrometab;
import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/model/cource_model.dart';

import '../controllers/course_controller.dart';

class CourseView extends GetView<CourseController> {
  const CourseView({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Your",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      Text(
                        "Desired Course",
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            FutureBuilder<List<Cource>>(
                future: controller.getDummyCource(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    final folders = snapshot.data!;
                    if (folders.isEmpty) {
                      return const Center(
                        child: Text("No Data"),
                      );
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 310,
                      ),
                      itemCount: folders.length,
                      itemBuilder: (_, index) {
                        return gridItem(context, folders[index]);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No Data"),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget gridItem(BuildContext context, Cource cource) => Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 40,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: cource.thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(cource.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              )),
                )
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => prevWeb(context, cource.url),
          ),
        ],
      );

  AppBar appBar(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text("Cources",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0072B5), Color(0xff3B3B98)],
              stops: [0.5, 1.0],
            ),
          ),
        ),
      );
}
