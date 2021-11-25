import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_pet/controllers/verify_controller.dart';
import 'package:my_pet/widgets/appbar.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);
  final VerifyController controller = VerifyController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Verification Code'),
              onChanged: (v) {
                controller.setCode(v);
              },
            ),
            ElevatedButton(
              child: const Text('Verify'),
              onPressed: () {
                controller.verify();
              },
            ),
            Obx(() => Text(controller.errorMsg.value)),
          ],
        ),
      ),
    );
  }
}
