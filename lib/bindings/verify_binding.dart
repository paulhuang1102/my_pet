import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/verify_controller.dart';
import 'package:my_pet/repositories/user_repository.dart';

class VerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyController>(() => VerifyController(UserRepository()));
  }
}
