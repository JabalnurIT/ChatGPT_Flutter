import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_course/constants/api_consts.dart';
import 'package:chatgpt_course/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonresponse = jsonDecode(response.body);

      if (jsonresponse['error'] != null) {
        print("jsonresponse['error'] ${jsonresponse['error']['message']}");
        throw HttpException(jsonresponse['error']['message']);
      }
      // print("jsonresponse $jsonresponse");

      List temp = [];

      for (var value in jsonresponse['data']) {
        temp.add(value);
        // log("value ${value['id']}");
      }

      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
