import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/models/pet_model.dart';
import 'package:my_pet/repositories/pet_repository.dart';

class PetController extends GetxController {
  static get to => Get.find<PetController>();
  final PetRepository _repo;

  final pets = RxList<Pet>([]);
  final loading = false.obs;
  final error = ''.obs;
  String? petsNextToken;

  PetController(this._repo);

  void getPets() async {
    final UserController userController = UserController.to;

    final data =
        await _repo.fetchPetList(userController.user!.id, petsNextToken);

    if (data != null) {
      pets(
        data.items
            .map(
              (el) => Pet(
                userId: userController.user!.id,
                name: el['name'],
                photoUrl: el['photoUrl'],
              ),
            )
            .toList(),
      );
      petsNextToken = data.nextToken;
    }
  }

  void clearPets() {
    pets.clear();
    petsNextToken = null;
  }
}
