import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calendarific/routes/route_helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    print("I am connected to a mobile network.");
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("I am connected to a wifi network.");
  } else {
    print("I am not connected");

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendarific',
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
      initialRoute: RouterHelper.getInitial(),
      getPages: RouterHelper.routes,
    );
  }
}