import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/cores/core_strings.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_images.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${CoreStrings.appName}",
                      style: TextStyle(
                          color: CoreColor.primary,
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("${CoreStrings.welcomeTitle}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: CoreColor.primarySoft,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
            SizedBox(height: 16),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Lottie.asset(CoreImages.medicJson),
                )),
            SizedBox(height: 16),
            GestureDetector(
              onTap: (() => Get.offAllNamed(Routes.HOME)),
              child: Container(
                height: 80,
                margin: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: CoreColor.primary),
                child: Center(
                    child: Text(
                  'GET STARTED',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
