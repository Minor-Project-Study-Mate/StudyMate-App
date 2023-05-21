import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../services/box/models/date_wrapper.dart';
import '../../../services/sheet/model/resources_entities.dart';
import '../utils/get_unique_tag.dart';
import 'home_controller.dart';

List<String> _getUncommonTag(List<List<String>> e) =>
    TagUtils().getUncommonTag(e);

class FavController {
  final HomeController controller;
  FavController(this.controller);

  final selectedTags = Rx<List<String>>([]);

  Future<void> addToFav(IndexFile file) async {
    final e = DateWrapper(date: DateTime.now(), file: file).toJson();
    controller.boxService.favBox.isFav(e)
        ? controller.boxService.favBox.removeFav(e)
        : controller.boxService.favBox.saveFav(e);
    controller.rerender();
  }

  Future<void> clearFavs() async => await controller.boxService.favBox
      .clearFavs()
      .then<void>((_) => controller.rerender());

  void toogleTagSelection(String tag) {
    (selectedTags.value.contains(tag))
        ? selectedTags.value.remove(tag)
        : selectedTags.value.add(tag);
    selectedTags.refresh();
  }

  bool containTag(String tag) => selectedTags.value.contains(tag);

  Future<List<String>> getTags() async {
    final tagsList = controller.boxService.favBox.getFavs.map((e) {
      final list = e.file.path.split("/");
      list.removeLast();
      return list;
    }).toList();
    return await compute<List<List<String>>, List<String>>(
        _getUncommonTag, tagsList);
  }

  List<DateWrapper> getFiltedFavs() {
    final list = (selectedTags.value.isEmpty)
      ? controller.boxService.favBox.getFavs
      : controller.boxService.favBox.getFavs
          .where((element) => selectedTags.value
              .every((tag) => element.file.path.contains(tag)))
          .toList();
      list.sort((a, b) => b.date.compareTo(a.date));
    return list;
  }

  void dispose() {
    selectedTags.close();
  }
}
