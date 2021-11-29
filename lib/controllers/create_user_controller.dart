import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/repositories/user_repository.dart';
import 'package:my_pet/routes/app_pages.dart';

class CreateUserController extends GetxController {
  static get to => Get.find<CreateUserController>();

  final UserRepository _repo;
  final loading = false.obs;
  final error = ''.obs;

  final UserController _userController = UserController.to;

  CreateUserController(this._repo);
  final nameController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }


  create() async {
    loading(true);

    final user = await _repo.createUserData(_userController.user!.id, nameController.text);

    loading(false);

    if (user != null) {
      Get.offNamed(ROUTES.home);
    }

  }


}
