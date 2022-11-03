import 'package:calendarific/controllers/france_controller.dart';
import 'package:get/get.dart';

class FranceScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FranceController>(
          () => FranceController(),
    );
  }
}