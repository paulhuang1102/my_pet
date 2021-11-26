import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:my_pet/controllers/user_controller.dart';

import 'package:my_pet/routes/app_pages.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  final String routeName;
  DefaultAppbar({Key? key, this.routeName = ''}) : super(key: key);
  final UserController userController = UserController.to;
  final List<Widget> _actions = [];

  @override
  Widget build(BuildContext context) {
    final bool showLeading = routeName != ROUTES.home;

    if (userController.user != null) {
      _actions.add(OutlinedButton(
        onPressed: () async {
          userController.logut();
        },
        child: const Text('Logout'),
      ));
    }

    return AppBar(
      leading: showLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            )
          : const SizedBox(),
      actions: _actions,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown, Colors.black]),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
