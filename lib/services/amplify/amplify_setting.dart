part of './amplify_service.dart';

class AmplifySetting {
  factory AmplifySetting() => instance;
  AmplifySetting._internal();

  static final AmplifySetting instance = AmplifySetting._internal();

  Future _configureamplify(config) async {
    try {
      await Amplify.addPlugins(
        [
          AmplifyAuthCognito(),
          AmplifyAPI(),
        ],
      );

      await Amplify.configure(amplifyconfig);

      Log.verbose('Amplify was configured successfully.');
    } on AmplifyAlreadyConfiguredException {
      Log.error(
          "Amplify was already configured. Looks like app restarted on android.");
    }
  }

  Future setup() async {
    return _configureamplify(amplifyconfig);
  }
}
