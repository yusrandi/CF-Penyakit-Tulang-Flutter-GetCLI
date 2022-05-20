import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/data/config/api.dart';
import 'package:get_cli_cf_flutter/app/data/models/basis.dart';
import 'package:http/http.dart' as http;

class BasisService extends GetConnect {
  Future<List<BasisModel>> fetchBasis() async {
    final response = await http.get(Uri.parse(Api.instance.getBasis));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => BasisModel.fromJson(e)).toList();
    }
  }
}
