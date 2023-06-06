import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_notice_controller.dart';

class CreateNoticeView extends GetView<CreateNoticeController> {
  const CreateNoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Create Notice'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth <= 600 ? double.infinity : 600,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: controller.titleController,
                              decoration:
                                  const InputDecoration(labelText: 'Title'),
                              validator: controller.titleFieldValidation,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: controller.descriptionController,
                              decoration: const InputDecoration(
                                  labelText: 'Description'),
                              validator: controller.descriptionFieldValidation,
                            ),
                            const SizedBox(height: 16.0),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: Obx(() => controller.imageURL.value != null
                                  ? Image.network(
                                      controller.imageURL.value ?? '',
                                      height: 200.0,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox()),
                            ),
                            TextFormField(
                              controller: controller.urlController,
                              decoration:
                                  const InputDecoration(labelText: 'URL'),
                              validator: controller.urlFieldValidation,
                              onChanged: controller.onImageUrlChanged,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              readOnly: true,
                              controller: controller.dateText,
                              decoration: const InputDecoration(
                                labelText: 'Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: () => controller.selectDateTime(),
                              validator: controller.dateFieldValidation,
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0)),
                              onPressed: controller.submit,
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(
                                  () => controller.submitting.value
                                      ? const SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator())
                                      : const Text('Submit'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
