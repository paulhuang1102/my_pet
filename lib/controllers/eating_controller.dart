import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/repositories/food_repository.dart';
import 'package:my_pet/utils/logger.dart';

class EatingController extends GetxController {
  final date = ''.obs;
  final time = ''.obs;
  final food = ''.obs;

  final FoodRepository _repo;

  static EatingController get to => Get.find<EatingController>();

  EatingController(this._repo);

  @override
  void onInit() {
    _repo.getList();
    super.onInit();
  }

  void setDate(String dataStr) {
    date(dataStr);
  }

  void setTime(String timeStr) {
    Log.debug(timeStr);
    time(timeStr);
  }

  void setFood(String foodStr) {
    food(foodStr);
  }


  Future submit() async {
   Log.info(food.value);

   Log.debug(DateTime.tryParse('${date.value} ${time.value}')!.millisecondsSinceEpoch);
   _repo.addFood({
     'timestamp': DateTime.tryParse('${date.value} ${time.value}')!.millisecondsSinceEpoch,
     'food': food.value,
   });
  }

}