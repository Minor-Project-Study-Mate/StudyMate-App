import '../models/app_user.dart';

abstract class AppUserUsecase {
  Future<void> saveAppUser(AppUser appUser);
  AppUser? get appUser;
  Future<void> deleteAppUser();
}