import 'package:flutter/material.dart';
import 'package:my_pet/controllers/add_pet_controller.dart';
import 'package:my_pet/routes/app_pages.dart';
import 'package:my_pet/widgets/appbar.dart';

class AddPetPage extends StatelessWidget {
  AddPetPage({Key? key}) : super(key: key);
  final AddPetController controller = AddPetController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(routeName: ROUTES.addPet,),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              child: Expanded(
                child: Column(
                  children: [
                    const Text('Add New Profile'),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      controller: controller.nameController,
                    ),
                    ElevatedButton(
                      child: const Text('Add '),
                      onPressed: controller.addPet,
                    )
                  ],
                ),
              ),
            ),
            const Divider(),
            TextButton(onPressed: () {}, child: const Text('Recover Profile'))
          ],
        ),
      ),
    );
  }
}
