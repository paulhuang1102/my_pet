import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:my_pet/constants/auth.dart';
import 'package:my_pet/models/api_model.dart';
import 'package:my_pet/models/credentail_model.dart';
import 'package:my_pet/utils/logger.dart';
import '../../amplifyconfiguration.dart';

part './amplify_auth.dart';
part './amplify_setting.dart';
part './amplify_api.dart';

class AmplifyService {
  factory AmplifyService() => instance;
  AmplifyService._internal();
  static final AmplifyService instance = AmplifyService._internal();

  AmplifySetting get setting => AmplifySetting();
  AmplifyAuth get auth => AmplifyAuth();
  AmplifyApi get api => AmplifyApi();


}