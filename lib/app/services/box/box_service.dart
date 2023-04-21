import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'datasource/theme_datasource.dart';
import 'datasource/user_datasources.dart';

class BoxService extends GetxService {
  late final ThemeDatasource theme;
  late final AppUserDataSource appUser;
  final box = GetStorage();

  Future<void> init() async {
    theme = ThemeDatasource(box);
    appUser = AppUserDataSource(box);
  }
}
