import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:joyjet_test/constants.dart';
import 'package:http/http.dart' as http;
import 'package:joyjet_test/models/api_response_model.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    fetchData();
  }

  List<ApiResponseModel> list = [];

  bool isLoading = false;
  bool hasError = false;

  Future<void> fetchData() async {
    hasError = false;
    isLoading = true;
    notifyListeners();

    try {
      var res = await http.get(kApiURL);

      if (res.statusCode == 200) {
        List<ApiResponseModel> items = [];

        (jsonDecode(res.body) as List).forEach((item) {
          items.add(ApiResponseModel.fromJson(item));
        });

        list = items;
        isLoading = false;
        notifyListeners();
      } else {
        hasError = true;
      }
    } catch (e) {
      hasError = true;
    }
  }
}
