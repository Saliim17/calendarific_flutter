import 'package:get/get_navigation/src/routes/get_route.dart';

import '../france_binding.dart';
import '../screens/france/france_screen.dart';

class RouterHelper{

  static const String initial = "/";
  static String getInitial()=> initial;

  static List<GetPage> routes = [

    GetPage(
      name: initial,
      page: () => const FranceScreen(),
      binding: FranceScreenBinding()),
  ];
}