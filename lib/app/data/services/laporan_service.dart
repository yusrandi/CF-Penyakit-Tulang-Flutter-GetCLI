import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/data/config/api.dart';
import 'package:http/http.dart' as http;

import '../models/laporan_model.dart';

class LaporanService extends GetConnect {
  Future<List<LaporanModel>> fetchLaporan() async {
    final response = await http.get(Uri.parse(Api.instance.getLaporan));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => LaporanModel.fromJson(e)).toList();
    }
  }

  Future<String> laporanStore(
      String penyakit_id, String user_id, String cf) async {
    var _response = await http.post(Uri.parse(Api().getLaporan), body: {
      "user_id": user_id,
      "penyakit_id": penyakit_id,
      "cf": cf,
    });

    print(_response.body);
    return _response.body;
  }
}
