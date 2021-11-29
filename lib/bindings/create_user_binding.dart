import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/create_user_controller.dart';
import 'package:my_pet/repositories/user_repository.dart';

class CreateUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUserController>(() => CreateUserController(UserRepository()));
  }
}