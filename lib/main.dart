import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calendarific/routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});// This widget is the root of your application.
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