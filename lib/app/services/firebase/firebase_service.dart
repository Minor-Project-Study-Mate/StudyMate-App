import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/datasource/cources_datasources.dart';
import 'package:study_mate/app/services/firebase/datasource/notice_event_datdsource.dart';
import 'package:study_mate/app/services/firebase/datasource/user_datasource.dart';

class FirebaseService extends GetxService {
  final firebase = FirebaseFirestore.instance;
  final noticeEventDatasource = NoticeEventDatasource();
  final userDatasources = UserDatasources();
  final courceDatasource = CourcesDatasources();
}
