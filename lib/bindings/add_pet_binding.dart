import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/add_pet_controller.dart';
import 'package:my_pet/repositories/pet_repository.dart';

class AddPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPetController(PetRepository()));
  }
}