import 'package:calendarific/controllers/api_controller.dart';

import 'package:get/get.dart';

class ApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiController>(
      () => ApiController(),
    );
  }
}
