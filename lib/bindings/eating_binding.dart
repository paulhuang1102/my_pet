import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/eating_controller.dart';
import 'package:my_pet/repositories/food_repository.dart';

class EatingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EatingController>(() => EatingController(FoodRepository()));
  }
}