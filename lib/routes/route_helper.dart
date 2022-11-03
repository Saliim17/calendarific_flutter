import 'package:get/get_navigation/src/routes/get_route.dart';

import '../dependencies/api_bindings.dart';
import '../screens/home_screen.dart';

class RouterHelper {

  static const String initial = "/";
  static String getInitial()=> initial;

  static List<GetPage> routes = [

    GetPage(
      name: initial,
      page: () => const HomeScreen(),
      binding: ApiBinding()),
  ];
}