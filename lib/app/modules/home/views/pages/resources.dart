import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../services/box/models/date_wrapper.dart';
import '../../../../services/sheet/model/resources_entities.dart';
import '../../controllers/home_controller.dart';
import '../widgets/hover_builder.dart';

class ResourcesBody extends StatelessWidget {
  const ResourcesBody(this.controller, {Key? key}) : super(key: key);
  final HomeController controller;

  Future<void> openDoc(BuildContext context, IndexFile file) async {
    await launchUrl(Uri.parse(file.id));
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => controller.resController.shouldGoBack,
        child: Scaffold(
          appBar: AppBar(
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
            () => controller.resController.hasData
                ? FutureBuilder<List<IndexEntity>>(
                    future: controller.resController.sheetService
                        .getList(controller.resController.currentPath),
                    builder: (context, snapshot) {
                      if ((controller.resController.currentEntity.isEmpty)) {
                        return const Center(child: Text('No files found'));
                      } else {
                        final list = controller.resController.currentEntity;
                        list.removeWhere((element) =>
                            element is IndexFile && element.size == 0);
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > 600) {
                              return resoursesListBuilder(list, true);
                            } else {
                              return resoursesListBuilder(list, false);
                            }
                          },
                        );
                      }
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
      );

  AnimationLimiter resoursesListBuilder(
          List<IndexEntity> list, bool isDesktop) =>
      AnimationLimiter(
        key: UniqueKey(),
        child: GetBuilder<HomeController>(
          builder: (controller) => ListView.builder(
            padding: isDesktop
                ? const EdgeInsets.only(right: 15, top: 5, bottom: 5)
                : const EdgeInsets.only(top: 5, bottom: 5),
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) =>
                AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 300),
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: isDesktop
                      ? HoverBuilder(
                          builder: (context, isHovering) =>
                              entityTile(list[index], context, isHovering),
                        )
                      : entityTile(list[index], context, true),
                ),
              ),
            ),
          ),
        ),
      );

  Widget entityTile(IndexEntity entity, BuildContext context, bool isHovering) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => (entity is IndexFolder)
            ? controller.resController.currentPath = "${entity.path}/"
            : openDoc(context, entity as IndexFile),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/images/backg.png'),
              fit: BoxFit.cover,
             
                colorFilter: Get.isDarkMode
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken)
         :null,
                  
            ),
          ),
          child: Row(
            children: [
              leadingIcon(
                context,
                isfolder: entity is IndexFolder,
                fileName: entity.name,
              ),
              const SizedBox(width: 16),
              Expanded(child: Text(entity.name)),
              tileTrailing(isHovering, entity),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileTrailing(bool isHovering, IndexEntity e) {
    final isFav = controller.boxService.favBox.isFav(e.path);
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: [
        if (e is IndexFile)
          isFav
              ? glowingFavIcon(e, isFav)
              : AnimatedOpacity(
                  opacity: isHovering ? 1 : 0,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
                  child:
                      isHovering ? glowingFavIcon(e, isFav) : const SizedBox(),
                ),
        if (e is IndexFile)
          Text(controller.resController
              .kiloBytesToString((e as IndexFile).size)),
      ],
    );
  }

  Widget glowingFavIcon(IndexFile e, bool isFav) => GestureDetector(
        onTap: () async {
          isFav
              ? await controller.boxService.favBox.removeFav(e.path)
              : await controller.boxService.favBox
                  .saveFav(DateWrapper(date: DateTime.now(), file: e).toJson());
          controller.rerender();
        },
        child: isFav
            ? const FaIcon(FontAwesomeIcons.solidStar, color: Colors.yellow)
            : const FaIcon(FontAwesomeIcons.star),
      );

  Widget leadingIcon(BuildContext context,
      {required bool isfolder, String fileName = ''}) {
    if (isfolder) {
      return Theme(
        data: Theme.of(context),
        child: FaIcon(
          FontAwesomeIcons.folderClosed,
          color: context.isDarkMode
              ? const Color(0xff0072B5)
              : Get.theme.primaryColor,
        ),
      );
    } else {
      final fileName0 = fileName.toLowerCase();
      if (fileName0.endsWith('.pdf')) {
        return FaIcon(FontAwesomeIcons.filePdf, color: Colors.red[400]);
      } else if (fileName0.endsWith('.pptx') || fileName0.endsWith('.ppt')) {
        return FaIcon(FontAwesomeIcons.filePowerpoint,
            color: Colors.yellow[400]);
      } else if (fileName0.endsWith('.docx') || fileName0.endsWith('.doc')) {
        return const FaIcon(FontAwesomeIcons.fileWord, color: Colors.blue);
      } else if (fileName0.endsWith('.xlsx') || fileName0.endsWith('.xls')) {
        return const FaIcon(FontAwesomeIcons.fileExcel, color: Colors.green);
      } else if (fileName0.endsWith('.png') ||
          fileName0.endsWith('.jpg') ||
          fileName0.endsWith('.jpeg')) {
        return const FaIcon(FontAwesomeIcons.fileImage, color: Colors.purple);
      }
      return const FaIcon(FontAwesomeIcons.solidFolderClosed);
    }
  }

  Future<void> launchUrl(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $uri';
    }
  }
}
