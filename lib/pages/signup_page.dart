import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_pet/controllers/signup_controller.dart';
import 'package:my_pet/widgets/appbar.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final SignupController controller = SignupController.to;
  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (v) {
                controller.setName(v);
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.add_reaction_outlined),
                  labelText: 'Username'),
            ),
            TextField(
              onChanged: (v) {
                controller.setEmail(v);
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.mail), labelText: 'Email'),
            ),
            TextField(
              onChanged: (v) {
                controller.setPassword(v);
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock_open), labelText: 'Password'),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.submit();
              },
              child: const Text('Signup'),
            ),
            Obx(() => Text(controller.errorMsg.value)),
          ],
        ),
      ),
    );
  }
}
