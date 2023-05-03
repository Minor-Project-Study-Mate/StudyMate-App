import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/box/models/date_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../services/sheet/model/resources_entities.dart';
import '../../controllers/home_controller.dart';
import '../widgets/hover_builder.dart';

class FavBody extends StatelessWidget {
  const FavBody({Key? key}) : super(key: key);

  Future<void> openDoc(HomeController controller, IndexFile file) async =>
      await launchUrl(Uri.parse(file.id));

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Favourites",
              style: Theme.of(context).textTheme.headline5,
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff0072B5), Color(0xff3B3B98)],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
          ),
          body: Obx(
            () {
              final favs = controller.favController.getFiltedFavs();
              return ListView.builder(
                padding:
                    GetPlatform.isWeb ? const EdgeInsets.only(right: 10) : null,
                itemCount: favs.length,
                itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: GetPlatform.isWeb
                        ? HoverBuilder(
                            builder: (context, hover) => favTile(
                                favs[index], controller, context, hover))
                        : favTile(favs[index], controller, context, true)),
              );
            },
          ),
        ),
      );

  Widget favTile(DateWrapper fav, HomeController controller,
          BuildContext context, bool hover) =>
      ListTile(
          title: Text(fav.file.name),
          onTap: () => openDoc(controller, fav.file),
          subtitle: Text(fav.file.path.replaceFirst("Resources/", ""),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey[600])),
          trailing: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: hover ? 1 : 0,
            child: IconButton(
              onPressed: () async => await controller.boxService.favBox
                  .removeFav(fav.file.path)
                  .then<void>((_) => controller.rerender()),
              icon: const Icon(Icons.delete),
            ),
          ));
}
