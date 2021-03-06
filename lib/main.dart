import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:my_pet/repositories/pet_repository.dart';
import 'package:my_pet/repositories/user_repository.dart';
import 'package:my_pet/services/amplify/amplify_service.dart';

import 'controllers/pet_controller.dart';
import 'controllers/user_controller.dart';
import 'routes/app_pages.dart';

void main() async {
  await initialize();
  runApp(const MyApp());
}

initialize() async {
  Get.put<PetController>(PetController(PetRepository()), permanent: true);
  Get.put<UserController>(UserController(UserRepository()), permanent: true);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserController userControllder = UserController.to;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    AmplifyService svc = AmplifyService();
    await svc.setting.setup();

    userControllder.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: ROUTES.home,
        getPages: AppPages.pages);
  }
}
