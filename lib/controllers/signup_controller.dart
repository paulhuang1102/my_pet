import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/constants/auth.dart';
import 'package:my_pet/repositories/user_repository.dart';
import 'package:my_pet/routes/app_pages.dart';
import 'package:my_pet/utils/logger.dart';

class SignupController extends GetxController {
  static get to => Get.find<SignupController>();

  final UserRepository _repo;

  final username = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final errorMsg = ''.obs;

  SignupController(this._repo);

  void setName(String name) {
    username(name);
  }

  void setEmail(String mail) {
    email(mail);
  }

  void setPassword(String pass) {
    password(pass);
  }

  submit() async {
    final result = await _repo.signup(username.value, email.value, password.value);
    Log.debug('Repo signup result $result');

     if (result.status == AuthFlowStatus.login) {
       errorMsg('User already exists');
    } else if (result.status == AuthFlowStatus.verification) {
      Get.toNamed(ROUTES.verification);
    } else {
      errorMsg(result.error);
    }
  }
}
