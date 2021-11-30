import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:my_pet/models/pet_model.dart';
import 'package:my_pet/routes/app_pages.dart';

class Picture extends StatelessWidget {
  const Picture({this.pet, Key? key}) : super(key: key);

  final Pet? pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.75,
      height: Get.width * 0.75,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
        image: pet != null ? DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            pet!.photoUrl!.isNotEmpty
                ? pet!.photoUrl!
                : 'https://cdn.hk01.com/di/media/images/1819846/org/06533828b63ad1e6064b67b298078bbf.jpg/1tY9oT3ULF1-e7JAQ6FFPhFznfxcXR99cM8KJXDPCiU?v=w1920',
          ),
        ) : null,
      ),
      child: pet == null
          ? TextButton(
              onPressed: () {
                Get.toNamed(ROUTES.addPet);
              },
              child: const Text('Add Pet'))
          : null
    );
  }
}
