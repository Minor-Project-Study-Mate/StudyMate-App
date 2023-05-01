import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'datasource/theme_datasource.dart';
// import 'datasource/user_datasources.dart';

class BoxService extends GetxService {
  late final ThemeDatasource themeBox;
  // late final AppUserDataSource appUserBox;
  final box = GetStorage();

  Future<void> init() async {
    themeBox = ThemeDatasource(box);
    // appUserBox = AppUserDataSource(box);
  }

  @override
  void onClose() {
    // appUserBox.diospose();
    super.onClose();
  }
}
