import 'package:get_cli_cf_flutter/app/data/services/gejala_service.dart';

void main() async {
  var tes = await GejalaService().fetchGejala();
  print(tes);
}
