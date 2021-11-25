import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_pet/routes/app_pages.dart';
import 'package:my_pet/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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