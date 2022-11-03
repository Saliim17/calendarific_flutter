import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:calendarific/models/json_model.dart';

class ApiController extends GetxController {

  // loading status and response json model
  var isLoading = false.obs;
  JsonModel? jsonModel;

  // year header request
  String _year = "";
  String getYear() => _year;
  void setYear(String year) => _year = year;

  // country header request
  String _country = "";
  String getCountry() => _country;
  void setCountry(String country) => _country = country;

  fetchData() async {

    try{

      // data is loading = true
      isLoading(true);

      //TODO api_key needs to be a env variable!!
      http.Response response = await http.get(Uri.tryParse(
          "https://calendarific.com/api/v2/holidays?api_key=350c6a49ee879bc41e6c2c5e13490719f0c6ec8c&country=${getCountry()}&year=${getYear()}")!);

      if(response.statusCode == 200){

        //data arrived succesfully
        var result = jsonDecode(response.body);
        jsonModel = JsonModel.fromJson(result);

      } else {

        if (kDebugMode) {
          print("error fetching data");
        }

      }
    } catch (e) {

      if (kDebugMode) {
        print("Error while getting data is $e");
      }

    } finally {
      isLoading(false);
    }
  }
}
