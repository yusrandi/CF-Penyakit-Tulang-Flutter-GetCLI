import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/modules/informasi/views/informasi_tulang_view.dart';
import 'package:get_cli_cf_flutter/app/modules/result/bindings/result_binding.dart';
import 'package:get_cli_cf_flutter/app/modules/result/views/result_view.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/diagnosa/bindings/diagnosa_binding.dart';
import '../modules/diagnosa/views/diagnosa_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informasi/bindings/informasi_binding.dart';
import '../modules/informasi/views/detail_informasi.dart';
import '../modules/informasi/views/informasi_sendi_view.dart';
import '../modules/konsultasi/bindings/konsultasi_binding.dart';
import '../modules/konsultasi/views/konsultasi_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tentang/bindings/tentang_binding.dart';
import '../modules/tentang/views/tentang_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_TULANG,
      page: () => InformasiTulangView(),
      binding: InformasiBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI_SENDI,
      page: () => InformasiSendiView(),
      binding: InformasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailInformasi(),
      binding: InformasiBinding(),
    ),
    GetPage(
      name: _Paths.KONSULTASI,
      page: () => KonsultasiView(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG,
      page: () => TentangView(),
      binding: TentangBinding(),
    ),
    GetPage(
      name: _Paths.DIAGNOSA,
      page: () => DiagnosaView(),
      binding: DiagnosaBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => ResultView(),
      binding: ResultBinding(),
    ),
  ];
}
