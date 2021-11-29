part of './amplify_service.dart';

class AmplifyAuth {
  AuthCredentials? _credentials;

  factory AmplifyAuth() => instance;
  AmplifyAuth._internal();
  static AmplifyAuth instance = AmplifyAuth._internal();

  Future<AuthResponse> signupWithCredentaials(
      SignUpCredentials credentials) async {
    try {
      final userAttributes = {'email': credentials.email};
      final result = await Amplify.Auth.signUp(
        username: credentials.username,
        password: credentials.password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );

      Log.info('signupWithCredentaials result $result');

      if (result.isSignUpComplete) {
        return loginWithCredentials(credentials);
      } else {
        _credentials = credentials;

        return AuthResponse(status: AuthFlowStatus.verification);
      }
    } on AmplifyException catch (authError) {
      Log.waring('Failed to sign up - $authError');

      if (authError is UsernameExistsException) {
        _credentials = credentials;

        // return AuthFlowStatus.verification;
      }

      return AuthResponse(status: AuthFlowStatus.signUp, error: authError.message);
    }
  }

  Future<AuthResponse> verifyCode(String code) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: _credentials!.username,
        confirmationCode: code,
      );

      if (result.isSignUpComplete) {
        return loginWithCredentials(_credentials!);
        // return AuthResponse(status: AuthFlowStatus.session);
      } else {
        if (result is CognitoSignUpResult) {
          Log.info('sign up result $result');
          return AuthResponse(status: AuthFlowStatus.signUp);
        }

        return AuthResponse(status: AuthFlowStatus.signUp);
      }
    } on AmplifyException catch (authError) {
      Log.waring('Failed to verify code - $authError');

      if (authError is NotAuthorizedException) {
        return loginWithCredentials(_credentials!);
      }

      return AuthResponse(
          status: AuthFlowStatus.verification, error: authError.message);
    }
  }

  Future<AuthResponse> loginWithCredentials(AuthCredentials credentials) async {
    try {
      final result = await Amplify.Auth.signIn(
          username: credentials.username, password: credentials.password);

      if (result.isSignedIn) {
        return AuthResponse(status: AuthFlowStatus.session);
      } else {
        return AuthResponse(
            status: AuthFlowStatus.login, error: 'User could not be signed in');
      }
    } on AmplifyException catch (authError) {
      Log.error('Could not login - $authError');
      return AuthResponse(
          status: AuthFlowStatus.login, error: authError.message);
    }
  }

  Future<AuthUser> featchUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  Future<bool> checkAuthStatus() async {
    final session = await Amplify.Auth.fetchAuthSession();
    return session.isSignedIn;
  }

  logout() async {
    await Amplify.Auth.signOut();
  }
}
