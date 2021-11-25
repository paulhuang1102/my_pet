import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/signup_controller.dart';
import 'package:my_pet/repositories/user_repository.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController(UserRepository()));
  }
}