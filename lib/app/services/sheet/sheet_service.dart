import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'model/resources_entities.dart';

const baseFolder = 'Resources/';

List<IndexEntity> _getList(Map<String, dynamic> arguments) {
  final path = arguments['path'] as String;
  final entities = arguments['entities'] as List<IndexEntity>;
  List<IndexEntity> list = [];

  for (final entity in entities) {
    if (entity.path.startsWith(path)) {
      if (entity is IndexFolder) {
        if (!entity.path.substring(path.length).contains('/')) {
          list.add(entity);
        }
      } else {
        if (!entity.path.substring(path.length).contains('/')) {
          list.add(entity);
        }
      }
    }
  }

  list = _sortList(list);
  return list;
}

List<IndexEntity> _sortList(List<IndexEntity> list) {
  list.sort((a, b) {
    if (a is IndexFolder && b is IndexFile) {
      return -1;
    } else if (a is IndexFile && b is IndexFolder) {
      return 1;
    } else {
      return a.name.compareTo(b.name);
    }
  });
  return list;
}

class SheetService extends GetxService {
  final hasData = Rx<bool>(false);
  final processing = Rx<bool>(false);
  List<List<String>>? data;
  final currentEntity = Rx<List<IndexEntity>>([]);
  final currentPath = Rx<String>(baseFolder);

  // Read csv data from assets using csv package
  Future<List<List<String>>> readSheetDataTest() async {
    final input = await rootBundle.loadString('assets/data/index_web.csv');
    final List<List<dynamic>> csvTable =
        const CsvToListConverter(shouldParseNumbers: false, eol: '\n')
            .convert(input);
    // remove first row
    csvTable.removeAt(0);

    // convert List<List<dynamic>> to List<List<String>> consider null safety
    final List<List<String>> csvTableString = csvTable
        .map((row) => row.map((cell) => cell.toString()).toList())
        .toList();
    return csvTableString;
  }

  Future<void> get getDataTest async => await readSheetDataTest().then((value) {
        data = value;
        hasData.value = true;
      });

  List<IndexEntity> get getEntities => data == null
      ? []
      : List.generate(
          data!.length,
          (index) => data![index][1] == ""
              ? IndexFolder(
                  name: data![index][0].split('/').last,
                  path: data![index][0],
                )
              : IndexFile(
                  name: data![index][0].split('/').last,
                  path: data![index][0],
                  id: data![index][1],
                  size: double.tryParse(data![index][2]) ?? -1,
                ),
        );

  Future<List<IndexEntity>> getList(String path) async {
    processing.value = true;
    currentEntity.value =
        await compute(_getList, {'path': path, 'entities': getEntities});
    processing.value = false;
    return currentEntity.value;
  }

  @override
  void onClose() {
    hasData.close();
    processing.close();
    currentEntity.close();
    currentPath.close();
    super.onClose();
  }
}
