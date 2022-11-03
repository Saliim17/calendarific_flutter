import 'dart:convert';
import 'package:calendarific/models/json_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController{

  var isLoading = false.obs;
  JsonModel? jsonModel;

  String _year = "";
  String getYear() => _year;
  void setYear(String year) {
    _year = year;
  }
  String _country = "";
  String getCountry() => _country;
  void setCountry(String country) {
    _country = country;
  }
  fetchData() async {
    try{
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          "https://calendarific.com/api/v2/holidays?api_key=350c6a49ee879bc41e6c2c5e13490719f0c6ec8c&country=${getCountry()}&year=${getYear()}")!);
      if(response.statusCode == 200){
        //data succesfully
        var result = jsonDecode(response.body);
        jsonModel = JsonModel.fromJson(result);
      } else {
        print("error fetching data");
      }
    } catch (e) {
      print("Error while getting data is $e");
    } finally {
      isLoading(false);
    }
  }
}
