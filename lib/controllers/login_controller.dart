import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/constants/auth.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/repositories/user_repository.dart';
import 'package:my_pet/utils/logger.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserRepository _repo;
  final UserController userController = UserController.to;

  LoginController(this._repo);

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  login() async {
    if (nameController.text.isEmpty || passwordController.text.isEmpty) {
    } else {
      final result =
          await _repo.signin(nameController.text, passwordController.text);
      Log.debug(result);

      if (result.status == AuthFlowStatus.session) {
        userController.loginUser();
      }
    }
  }
}
