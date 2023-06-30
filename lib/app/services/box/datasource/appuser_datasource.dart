import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../firebase/model/app_user_model.dart';

class AppUserDatasource {
  final GetStorage box;
  AppUserDatasource(this.box);

  final appUser = Rx<AppUser?>(null);

  Future<void> init() async => appUser.value = await getAppUser();

  Future<AppUser?> getAppUser() async {
    final res = await box.read('user');
    if (res == null) return null;
    print(res);
    return AppUser.fromJson(res);
  }

  Future<void> deleteAppUser() async {
    await box.remove('user');
  }

  Future<void> updateAppUser(AppUser? user) async {
    appUser.value = user;

    await box.write('user', user?.toJson() ?? "");
  }
}
