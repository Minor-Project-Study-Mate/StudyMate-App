import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_mate/app/services/firebase/model/notice_modal.dart';

import '../../../services/firebase/firebase_service.dart';

class CreateNoticeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final urlController = TextEditingController();
  final imageUrlController = TextEditingController();
  final dateText = TextEditingController();

  final imageURL = Rx<String?>(null);
  final submitting = false.obs;

  DateTime date = DateTime.now();

  String? dateFieldValidation(String? value) =>
      (value == null || value.isEmpty) ? 'Please enter a date' : null;

  String? titleFieldValidation(String? value) =>
      (value == null || value.isEmpty) ? 'Please enter a title' : null;

  String? descriptionFieldValidation(String? value) =>
      (value == null || value.isEmpty) ? 'Please enter a description' : null;

  String? urlFieldValidation(String? value) {
    final urlRegex = RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
    if (value == null || value.isEmpty) {
      return 'Please enter a URL';
    } else if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  void onImageUrlChanged(String? value) =>
      imageURL.value = urlFieldValidation(value) == null ? value : null;

  void selectDateTime() async {
    date = await showDatePicker(
      context: Get.context!,
      initialDate: date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((value) async {
      if (value == null) return date;
      final time = await showTimePicker(
          context: Get.context!, initialTime: TimeOfDay.now());
      if (time == null) return date;
      final dateTime =
          DateTime(value.year, value.month, value.day, time.hour, time.minute);
      dateText.text =
          "${value.day.toString().padLeft(2, '0')}/${value.month.toString().padLeft(2, '0')}/${value.year.toString().substring(2)} ${time.format(Get.context!)}";
      return dateTime;
    });
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      final firebaseService = Get.find<FirebaseService>();
      submitting.value = true;
      try {
        await Future.delayed(const Duration(milliseconds: 500));
        await firebaseService.noticeEventDatasource.createEvent(Event(
          title: titleController.text,
          description: descriptionController.text,
          url: urlController.text,
          dateTime: date,
        ));
        Get.back();
        Get.snackbar(
          'Success',
          'Notice created successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
      submitting.value = false;
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    urlController.dispose();
    imageUrlController.dispose();
    dateText.dispose();
    imageURL.close();
    super.onClose();
  }
}
