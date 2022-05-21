import 'package:get_cli_cf_flutter/app/data/services/basis_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/gejala_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/laporan_service.dart';

void main() async {
  var tes = await LaporanService().laporanStore("2", "1", "0.35");
  print(tes);
}
