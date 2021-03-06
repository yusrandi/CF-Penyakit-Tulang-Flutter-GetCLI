import 'dart:math';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/data/models/basis.dart';
import 'package:get_cli_cf_flutter/app/data/models/penyakit.dart';
import 'package:get_cli_cf_flutter/app/data/services/basis_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/laporan_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/penyakit_service.dart';
import 'package:get_cli_cf_flutter/app/modules/auth/controllers/authentication_manager.dart';
import 'package:get_cli_cf_flutter/app/routes/app_pages.dart';

import '../../../data/models/gejala.dart';
import '../../../data/services/gejala_service.dart';
import '../../diagnosa/controllers/diagnosa_controller.dart';

class ResultController extends GetxController {
  final count = 0.obs;
  final resultText = "".obs;

  RxList<ResultModel> dataListResult = (List<ResultModel>.of([])).obs;
  final AuthenticationManager authenticationManager = Get.find();

  @override
  void onInit() async {
    super.onInit();

    print(Get.arguments);

    List<Gejala> gejalas = await getGejala();
    List<BasisModel> basis = await getBasis();
    List<Penyakit> penyakit = await getPenyakit();
    List<DiagnosaModel> userCf = Get.arguments;
    // print(penyakit);

    resultText.value = "";

    List allResult = [];
    penyakit.forEach((eP) {
      double cfOld = 0;
      double resultCF = 0;
      double total = 0;
      basis.forEach((eB) {
        if (eP.id == eB.penyakitId) {
          userCf.forEach((element) {
            if (element.id == eB.gejalaId) {
              double cfCombine =
                  roundDouble((double.parse(eB.bobot!) * element.value), 2);
              double cfGabungan =
                  roundDouble((cfOld + cfCombine * (1 - cfOld)), 2);
              resultText.value +=
                  "\nPenyakit ${eP.penyakitNama}, Gejala ${eB.gejalaId} \nCf Pakar ${eB.bobot} * Cf User ${element.value}, CF Combine ${cfCombine}, CfOld ${cfOld}, CF Gabungan ${cfGabungan}";
              cfOld = cfGabungan;
              resultCF = cfGabungan;
            }
          });
        }
      });
      allResult.add(resultCF);
      dataListResult.add(ResultModel(eP, resultCF));
      count.value += 1;

      resultText.value +=
          "\nResult $resultCF\n=========================================================\n";
    });
  }

  getListResult() {
    return dataListResult.sort(
      (a, b) => b.value.compareTo(a.value),
    );
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<List<Gejala>> getGejala() async {
    return await GejalaService().fetchGejala();
  }

  Future<List<Penyakit>> getPenyakit() async {
    return await PenyakitService().fetchPenyakit();
  }

  Future<List<BasisModel>> getBasis() async {
    return await BasisService().fetchBasis();
  }

  Future<String> storeResult(String penyakit_id, String cf) async {
    String result = await LaporanService()
        .laporanStore(penyakit_id, authenticationManager.getToken()!, cf);

    Get.offAndToNamed(Routes.HOME);

    return result;
  }
}

class ResultModel {
  Penyakit? penyakit;
  double value;
  ResultModel(this.penyakit, this.value);
}
