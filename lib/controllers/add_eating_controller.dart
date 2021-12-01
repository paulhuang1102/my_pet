import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/eating_controller.dart';
import 'package:my_pet/controllers/pet_controller.dart';
import 'package:my_pet/models/eating_model.dart';
import 'package:my_pet/repositories/food_repository.dart';
import 'package:my_pet/utils/logger.dart';

class AddEatingController extends GetxController {
  final date = ''.obs;
  final time = ''.obs;

  final FoodRepository _repo;

  static AddEatingController get to => Get.find<AddEatingController>();
  final PetController _petController = PetController.to;
  final TextEditingController foodController = TextEditingController();

  AddEatingController(this._repo);

  @override
  void onInit() {
    _repo.getList();
    super.onInit();
  }
  
  @override
  void onClose() {
    foodController.dispose();
    super.onClose();
  }

  void setDate(String dataStr) {
    date(dataStr);
  }

  void setTime(String timeStr) {
    Log.debug(timeStr);
    time(timeStr);
  }

  Future submit() async {
    final DateTime t = DateTime.tryParse('${date.value} ${time.value}')!;

    final id = await _repo.addFood(
      timestamp: t.millisecondsSinceEpoch,
      food: foodController.text,
      petId: _petController.pets[0].id,
    );

    if (id != null) {
      final EatingController eatingController = EatingController.to;
      eatingController.addEating(
        Eating(
          id: id,
          food: foodController.text,
          date: t,
        ),
      );

      foodController.clear();
      time('');
      date('');
    }
  }
}
