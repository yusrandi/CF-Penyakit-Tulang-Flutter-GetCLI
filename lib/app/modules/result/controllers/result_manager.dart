import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/modules/result/controllers/cache_result.dart';

class ResultManager extends GetxController with CacheResult {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
  }

  void insertTulang(double tulang) async {
    await saveTulang(tulang: tulang);
  }

  void insertSendi(double sendi) async {
    await saveSendi(sendi: sendi);
  }
}
