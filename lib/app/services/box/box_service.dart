import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'datasource/appuser_datasource.dart';
import 'datasource/fav_datasources.dart';
import 'datasource/theme_datasource.dart';

class BoxService extends GetxService {
  late final ThemeDatasource themeBox;
  late final FavDatasources favBox;
  late final AppUserDatasource appUser;
  final box = GetStorage();

  Future<void> init() async {
    themeBox = ThemeDatasource(box);
    favBox = FavDatasources(box);
    appUser = AppUserDatasource(box);
    appUser.init();
  }
}
