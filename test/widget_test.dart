import 'package:get_cli_cf_flutter/app/data/services/basis_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/gejala_service.dart';

void main() async {
  var tes = await BasisService().fetchBasis();
  print(tes);
}
