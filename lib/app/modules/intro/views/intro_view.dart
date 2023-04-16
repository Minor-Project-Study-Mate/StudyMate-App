import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study_mate/app/routes/app_pages.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Expanded(child: Image.asset("assets/images/Intro.png"))
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                color:Colors.blue,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Hello KIITIANS !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            wordSpacing: 2.5,
                             fontWeight: FontWeight.bold,
                            height: 1.5,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        //  Here we repleace sizebox with spacer
                        Row(
                          //button position
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              height: 60,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              color: const Color.fromARGB(255, 226, 82, 82),
                              onPressed: () {
                                //home screen path
                                Get.toNamed(Routes.AUTH);
                              },
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}