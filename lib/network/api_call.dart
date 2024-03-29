import 'dart:convert';

import 'package:heavy_metals/models/model.dart';
import 'package:http/http.dart' as http;

class NetworkCall {
  Future<List<MetalsModel>> fetchMetalsData() async {
    final response =
        await http.get(Uri.parse('https://toxmet.xyz/api/water-test'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MetalsModel> metalsList =
          data.map((json) => MetalsModel.fromJson(json)).toList();
      return metalsList;
    } else {
      throw Exception('Failed to load metals data');
    }
  }
}
