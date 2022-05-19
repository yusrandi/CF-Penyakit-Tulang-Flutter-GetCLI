import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/modules/dashboard/views/dashboard_view.dart';

import '../../../cores/core_colors.dart';
import '../../informasi/views/informasi_view.dart';
import '../../konsultasi/views/konsultasi_view.dart';
import '../../tentang/views/tentang_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: CoreColor.whiteSoft),
        child: Stack(
          children: [
            Obx((() => Container(
                child: controller.count.value == 0
                    ? DashboardView()
                    : controller.count.value == 1
                        ? InformasiView()
                        : controller.count.value == 2
                            ? KonsultasiView()
                            : TentangView()))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1,
                        child: _listMenu("assets/icons/home-filled.svg", 0)),
                    Expanded(
                        flex: 1,
                        child:
                            _listMenu("assets/icons/bookmark-filled.svg", 1)),
                    Expanded(
                        flex: 1,
                        child: _listMenu("assets/icons/Bill Icon.svg", 2)),
                    Expanded(
                        flex: 1,
                        child: _listMenu("assets/icons/Settings.svg", 3)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listMenu(String title, int index) {
    return Obx((() => GestureDetector(
          onTap: () {
            controller.setIndex(index);
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: controller.count.value == index
                    ? CoreColor.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Center(
                child: SvgPicture.asset(
                  title,
                  color: controller.count.value == index
                      ? Colors.white
                      : CoreColor.primary,
                  height: 30,
                ),
              ),
            ),
          ),
        )));
  }
}
