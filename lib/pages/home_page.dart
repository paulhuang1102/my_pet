import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:my_pet/controllers/pet_controller.dart';
import 'package:my_pet/routes/app_pages.dart';
import 'package:my_pet/widgets/appbar.dart';
import 'package:my_pet/widgets/picture.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PetController petController = PetController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        routeName: ROUTES.home,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Obx(() => Text(controller.user.name)),
            Obx(
              () => Picture(
                pet: petController.pets.isNotEmpty
                    ? petController.pets[0]
                    : null,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ROUTES.eating);
              },
              child: const Text('Eating'),
            ),
            ElevatedButton(
              onPressed: () {
                // controller.setName(DateTime.now().toString());
              },
              child: const Text('Test'),
            ),
          ],
        ),
      ),
    );
  }
}
