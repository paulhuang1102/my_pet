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

  void setUserName(String name) {
    _user(User(name: name));
  }

  void loginUser() async {
    final name = await _repo.fetchUser();
    setUserName(name);
    // AnalyticsService.log(LoginEvent());

    Get.offNamed(ROUTES.home);
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
