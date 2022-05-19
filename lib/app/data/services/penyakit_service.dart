import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/data/config/api.dart';
import 'package:get_cli_cf_flutter/app/data/models/penyakit.dart';
import 'package:http/http.dart' as http;

class PenyakitService extends GetConnect {
  Future<List<Penyakit>> fetchPenyakit() async {
    final response = await http.get(Uri.parse(Api.instance.getPenyakits));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Penyakit.fromJson(e)).toList();
    }
  }
}
