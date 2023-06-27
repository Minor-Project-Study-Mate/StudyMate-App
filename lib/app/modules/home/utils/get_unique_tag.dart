class TagUtils {
  String getFirstTag(List<List<String>> paths) {
    for (var path in paths) {
      if (path.isNotEmpty) {
        return path[0];
      }
    }
    return "";
  }

  List<List<String>> removeTag(List<List<String>> paths, String tag) {
    // for (var path in paths) {
    //   if (path.isNotEmpty && path.contains(tag)) {
    //     path.remove(tag);
    //   }
    // }
    // return paths;
    return paths.map((path) => path..remove(tag)).toList();
  }

  List<List<String>> removeEmptyPaths(List<List<String>> paths) {
    // for (var path in paths) {
    //   if (path.isEmpty) {
    //     paths.remove(path);
    //   }
    // }
    // return paths;
    return paths.where((path) => path.isNotEmpty).toList();
  }

  int getTagCount(List<List<String>> paths, String tag) {
    // var count = 0;
    // for (var path in paths) {
    //   if (path.contains(tag)) {
    //     count++;
    //   }
    // }
    // return count;
    return paths.fold(
        0, (count, value) => count + (value.contains(tag) ? 1 : 0));
  }

  bool isPresentInAllLists(List<List<String>> paths, String tag) {
    // for (var path in paths) {
    //   if (!path.contains(tag)) {
    //     return false;
    //   }
    // }
    // return true;
    return paths.every((path) => path.contains(tag));
  }

  List<String> getUncommonTag(List<List<String>> paths) {
    final tags = <String>[];
    while (paths.isNotEmpty) {
      final tag = getFirstTag(paths);
      final count = getTagCount(paths, tag);
      if (!isPresentInAllLists(paths, tag) && count > 1) {
        tags.add(tag);
      }

      paths = removeTag(paths, tag);
      paths = removeEmptyPaths(paths);
    }
    return tags;
  }
}
