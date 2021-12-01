import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/add_eating_controller.dart';
import 'package:my_pet/repositories/food_repository.dart';

class AddEatingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEatingController>(() => AddEatingController(FoodRepository()));
  }
}