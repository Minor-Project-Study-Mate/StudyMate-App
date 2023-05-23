import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class FavOptionPanel extends StatelessWidget {
  const FavOptionPanel({Key? key}) : super(key: key);

  Widget sortingEntity(HomeController controller, String tag, bool selected) =>
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: selected ? Get.theme.colorScheme.primary : Get.theme.cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => controller.favController.toogleTagSelection(tag),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              tag,
              style: TextStyle(
                  color: selected
                      ? Get.theme.colorScheme.onPrimary
                      : Get.theme.colorScheme.onSurface),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (controller) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.boxService.favBox.getFavs.isNotEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextButton(
                      //   onPressed: () =>
                      //       controller.boxService.favBox.clearFavs(),
                      //   child: const Text(
                      //     "Clear all favorites",
                      //     style: TextStyle(fontStyle: FontStyle.italic),
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: FutureBuilder<List<String>>(
                              future: controller.favController.getTags(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final List<String> tags = snapshot.data ?? [];
                                  if (tags.isEmpty) return const SizedBox();
                                  return Obx(
                                    () => SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: List.generate(
                                            tags.length,
                                            (index) => sortingEntity(
                                                controller,
                                                tags[index],
                                                controller.favController
                                                    .selectedTags.value
                                                    .contains(tags[index]))),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ));
}
