import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:my_pet/models/credentail_model.dart';
import 'package:my_pet/models/user_model.dart';
import 'package:my_pet/services/amplify/amplify_service.dart';
import 'package:my_pet/services/graphql/mutations/user_mutation.dart';
import 'package:my_pet/services/graphql/queries/user_query.dart';

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

  Future<AuthUser> fetchUser() async {
    return _amplify.auth.featchUser();
  }

  Future<bool> checkUser() async {
    return _amplify.auth.checkAuthStatus();
  }

  Future logout() async {
    return _amplify.auth.logout();
  }

  Future<User?> getUserData(String id) async {
    final res = await _amplify.api.query(getUser, {'id': id});

    if (res.success && res.data['getUser'] != null) {
      return User(id: id, name: res.data['getUser']['name']);
    }
  }

  Future<User?> createUserData(String cognitoId, String name) async {
    final res = await _amplify.api.mutation(createUser, {
      'id': cognitoId,
      'name': name,
    });

    if (res.success) {
      return User(id: cognitoId, name: name);
    }
  }
}
