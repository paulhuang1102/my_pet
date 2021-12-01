import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/controllers/pet_controller.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/models/eating_model.dart';
import 'package:my_pet/repositories/food_repository.dart';
import 'package:my_pet/utils/logger.dart';

class EatingController extends GetxController {
  final FoodRepository _repo;
  String? listNextToken;
  EatingController(this._repo);

  static get to => Get.find<EatingController>();

  final UserController userController = UserController.to;
  final PetController petController = PetController.to;

  final eatings = RxList<Eating>([]);

  @override
  void onInit() {
    getEatings();
    super.onInit();
  }

  void addEating(Eating eating) {
    eatings.add(eating);
  }

  void getEatings() async {
    print(petController.pets[0].id);
    final data =
        await _repo.getFoodList(petController.pets[0].id, listNextToken);

    listNextToken = data.nextToken;
    eatings(data.items
        .map((el) => Eating(
            id: el['id'],
            food: el['food'],
            date: DateTime.fromMillisecondsSinceEpoch(
                int.parse(el['timestamp']))))
        .toList());
  }
}
