import 'package:flutter/material.dart';
import 'package:my_pet/controllers/create_user_controller.dart';

class CreateUserPage extends StatelessWidget {
  CreateUserPage({Key? key}) : super(key: key);
  final CreateUserController controller = CreateUserController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.nameController,
              ),
              ElevatedButton(
                  onPressed: controller.create, child: const Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
