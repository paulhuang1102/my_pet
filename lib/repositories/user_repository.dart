import 'package:my_pet/models/credentail_model.dart';
import 'package:my_pet/services/amplify/amplify_service.dart';

class UserRepository {
  final _amplify = AmplifyService();

  Future<AuthResponse> signup(
      String username, String email, String password) async {
    final SignUpCredentials credentials = SignUpCredentials(
      username: username,
      password: password,
      email: email,
    );
    return await _amplify.auth.signupWithCredentaials(credentials);
  }

  Future<AuthResponse> signin(String username, String password) async {
    final LoginCredentials credentials = LoginCredentials(
      username: username,
      password: password,
    );
    return _amplify.auth.loginWithCredentials(credentials);
  }

  Future<AuthResponse> verifyCode(String code) async {
    return _amplify.auth.verifyCode(code);
  }

  Future<String> fetchUser() async {
    return _amplify.auth.featchUser();
  }

  Future<bool> checkUser() async {
    return _amplify.auth.checkAuthStatus();
  }

  Future logout() async {
    return _amplify.auth.logout();
  }
}
