import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/repositories/pet_repository.dart';

class AddPetController extends GetxController {

  static get to => Get.find<AddPetController>();

  final PetRepository _repo;

  final TextEditingController nameController = TextEditingController();
  final UserController userController = UserController.to;

  AddPetController(this._repo);

  @override
  onClose() {
    nameController.dispose();
    super.onClose();
  }

  Future addPet() async {
    print(userController.user!.id);
    final success = await _repo.addPet(name: nameController.text, userId: userController.user!.id);

    if (success) {
      Get.back();
    }
  }

}