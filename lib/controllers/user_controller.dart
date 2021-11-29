import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/repositories/user_repository.dart';
import 'package:my_pet/routes/app_pages.dart';
import 'package:my_pet/utils/logger.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  final _user = Rx<User?>(User());
  final UserRepository _repo;

  static UserController get to => Get.find<UserController>();
  User? get user => _user.value;

  UserController(this._repo);

  void setUser(User user) {
    _user(user);
  }

  void loginUser() async {
    final cognitoUser = await _repo.fetchUser();

    setUser(User(name: cognitoUser.username, id: cognitoUser.userId));
    final user = await _repo.getUserData(cognitoUser.userId);

    if (user != null) {
      setUser(user);
      Get.offNamed(ROUTES.home);
    } else {
      Get.offNamed(ROUTES.createUser);
    }
    // AnalyticsService.log(LoginEvent());

  }

  void checkUser() async {
    final succeess = await _repo.checkUser();
    Log.debug(succeess);
    if (succeess) {
      loginUser();
    } else {
      _user(null);
      Get.offNamed(ROUTES.login);
    }
  }

  void logut() async {
    _repo.logout();
    Get.offAllNamed(ROUTES.login);
  }
}
