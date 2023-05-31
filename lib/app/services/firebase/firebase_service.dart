import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/datasource/notice_event_datdsource.dart';
import 'package:study_mate/app/services/firebase/datasource/useer_datasource.dart';

class FirebaseService extends GetxService {
  final firebase = FirebaseFirestore.instance;
  late final NoticeEventDatasource noticeEventDatasource;
  late final UserDatasources userDatasources;

  @override
  void onInit() {
    noticeEventDatasource = NoticeEventDatasource(firebase);
    userDatasources = UserDatasources(firebase);
    super.onInit();
  }
}
