import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    gradient: LinearGradient(
                      colors: [Color(0xff3B3B98), Color(0xff0072B5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    // borderRadius: BorderRadius.circular(20),
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
                color: const Color.fromARGB(255, 5, 95, 169),
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
                        Text(
                          "Welcome",
                          style: GoogleFonts.lobster(
                            textStyle: const TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Hello KIITIANS !",
                          style: GoogleFonts.sourceSerifPro(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
