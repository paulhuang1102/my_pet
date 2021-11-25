import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/constants/auth.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/repositories/user_repository.dart';

class VerifyController extends GetxController {
  static get to => Get.find<VerifyController>();

  final UserController userController = Get.find<UserController>();

  final UserRepository _repo;

  final code = ''.obs;
  final errorMsg = ''.obs;

  VerifyController(this._repo);

  void setCode(String c) {
    code(c);
  }

  verify() async {
    final result = await _repo.verifyCode(code.value);

    if (result.error.isNotEmpty) {
      errorMsg('Invalid code');
    } else if (result.status == AuthFlowStatus.session) {
      userController.loginUser();
    }
  }
}
