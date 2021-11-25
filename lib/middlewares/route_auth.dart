import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:my_pet/controllers/user_controller.dart';
import 'package:my_pet/routes/app_pages.dart';

class RouteAuthMiddleware extends GetMiddleware {
  final UserController userController = UserController.to;

  RouteAuthMiddleware({priority}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    return userController.user == null
        ? const RouteSettings(name: ROUTES.login)
        : null;
  }
}
