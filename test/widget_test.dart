import 'dart:convert';

import 'package:get_cli_cf_flutter/app/data/config/api.dart';
import 'package:get_cli_cf_flutter/app/data/services/basis_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/gejala_service.dart';
import 'package:get_cli_cf_flutter/app/data/services/laporan_service.dart';

import 'package:http/http.dart' as http;

void main() async {
  var _response = await http.post(Uri.parse(Api().getUser + '/login'), body: {
    "phone": "000",
    "password": "87654321",
  });

  var data = json.decode(_response.body);
  print(data);
}
