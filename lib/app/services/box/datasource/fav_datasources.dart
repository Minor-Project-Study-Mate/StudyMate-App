import 'package:get_storage/get_storage.dart';

import '../models/date_wrapper.dart';

const _favKey = "favs";

class FavDatasources {
  final GetStorage box;
  const FavDatasources(this.box);

  List<String> get _favs => (box.read<List?>(_favKey) ?? []).cast<String>();

  Future<void> saveFav(String path) async {
    if (!_favs.contains(path)) {
      _favs.add(path);
      await box.write(_favKey, _favs);
    }
  }

  List<DateWrapper> get getFavs => (box.read<List?>(_favKey) ?? [])
      .cast<String>()
      .map((e) => DateWrapper.fromJson(e))
      .toList();

  Future<void> removeFav(String path) async {
    _favs.removeWhere(
        (element) => DateWrapper.fromJson(element).file.path == path);
    await box.write(_favKey, _favs);
  }

  bool isFav(String path) {
    for (final element in _favs
        .map((e) => DateWrapper.fromJson(e))
        .map((e) => e.file)
        .map((e) => e.path)) {
      if (element == path) {
        return true;
      }
    }
    return false;
  }

  Future<void> clearFavs() async => await box.remove(_favKey);
}
