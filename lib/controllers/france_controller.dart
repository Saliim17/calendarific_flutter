import 'dart:convert';
import 'dart:developer';
import 'package:calendarific/models/france_holiday_model.dart';
import 'package:http/http.dart' as http;

class FranceController {

  FranceHolidayModel? franceHolidayModel;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  getApi() async {
    try{
      http.Response response = await http.get(
          Uri.tryParse('https://calendarific.com/api/v2/holidays?api_key=350c6a49ee879bc41e6c2c5e13490719f0c6ec8c&country=FR&year=2022')!,
      );
      if(response.statusCode == 200){
        ///data successfully

        var result = jsonDecode(response.body);
        franceHolidayModel =  FranceHolidayModel.fromJson(result);

      }else{
        ///error
      }
    }catch(e){
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      _isLoaded = true;
    }
  }
}
