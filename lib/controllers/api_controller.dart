import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

    //secret api_key is loaded from .env file
    String key = dotenv.get("API_KEY", fallback: "");
    String base_url = dotenv.get("BASE_URL", fallback: "");

    try{
      // data is loading = true
      isLoading(true);

      //TODO api_key needs to be a env variable!!
      http.Response response = await http.get(Uri.tryParse(
          "$base_url?api_key=$key&country=${getCountry()}&year=${getYear()}")!);

      if(response.statusCode == 200){

        //data arrived correctly
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
