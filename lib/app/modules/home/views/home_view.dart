import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get_cli_cf_flutter/app/modules/informasi/views/informasi_tulang_view.dart';

import '../../../cores/core_colors.dart';
import '../../auth/controllers/authentication_manager.dart';
import '../../auth/views/auth_view.dart';
import '../../informasi/views/informasi_sendi_view.dart';
import '../../konsultasi/views/konsultasi_view.dart';
import '../../tentang/views/tentang_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Container body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: CoreColor.whiteSoft),
      child: Stack(
        children: [
          Obx((() => Container(
              child: controller.count.value == 0
                  ? DashboardView()
                  : controller.count.value == 1
                      ? InformasiTulangView()
                      : controller.count.value == 2
                          ? InformasiSendiView()
                          : controller.count.value == 3
                              ? KonsultasiView()
                              : TentangView()))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child:
                          _listMenu("assets/icons/home-filled.svg", 0, "Home")),
                  Expanded(
                      flex: 1,
                      child: _listMenu(
                          "assets/icons/bookmark-filled.svg", 1, "Tulang")),
                  Expanded(
                      flex: 1,
                      child: _listMenu(
                          "assets/icons/bookmark-filled.svg", 2, "Sendi")),
                  Expanded(
                      flex: 1,
                      child: _listMenu(
                          "assets/icons/Bill Icon.svg", 3, "Diagnosa")),
                  Expanded(
                      flex: 1,
                      child:
                          _listMenu("assets/icons/Settings.svg", 4, "Dokter")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listMenu(String title, int index, String menu) {
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
            child: Column(
              children: [
                Padding(
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
                Text(
                  menu,
                  style: TextStyle(
                      color: controller.count.value == index
                          ? Colors.white
                          : CoreColor.primary),
                )
              ],
            ),
          ),
        )));
  }
}
