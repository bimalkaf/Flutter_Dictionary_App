import 'dart:convert';

import 'package:flutter_dictionary_app/response_model.dart';
import 'package:http/http.dart' as http;

class API {
  static const String baseUrl =
      "https://api.dictionaryapi.dev/api/v2/entries/en/";

  static Future<ResponseModel> fetchMeaning(String word) async {
    final response = await http.get(Uri.parse("$baseUrl$word"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ResponseModel.fromJson(data[0]);
    } else {
      throw Exception("failed to load meaning");
    }
  }
}
