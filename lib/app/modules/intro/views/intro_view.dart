import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IntroView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
