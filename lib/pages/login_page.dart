import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:my_pet/controllers/login_controller.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/routes/app_pages.dart';

class LoginPage extends StatelessWidget {
  final UserController controller = UserController.to;
  final LoginController loginController = LoginController.to;
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 40),
          child: Stack(children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Username TextField
                  TextField(
                    controller: loginController.nameController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.add_reaction_outlined),
                        labelText: 'Username'),
                  ),
                  // Password TextField
                  TextField(
                    controller: loginController.passwordController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock_open), labelText: 'Password'),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await loginController.login();
                    },
                    child: const Text('Login'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     try {
                  //       var res = await Amplify.Auth.signInWithWebUI(
                  //           provider: AuthProvider.google);
                  //     } on AmplifyException catch (e) {
                  //       Log.error(e.message);
                  //     }
                  //   },
                  //   child: const Text('Google'),
                  // ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(ROUTES.signup);
                  },
                  child: const Text('Don\'t have an account? Sign up.')),
            )
          ])),
    );
  }
}
