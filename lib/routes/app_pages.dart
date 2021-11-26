import 'package:get/get.dart';
import 'package:my_pet/bindings/eating_binding.dart';
import 'package:my_pet/bindings/login_binding.dart';
import 'package:my_pet/bindings/signup_binding.dart';
import 'package:my_pet/bindings/verify_binding.dart';
import 'package:my_pet/middlewares/route_auth.dart';
import 'package:my_pet/pages/eating_page.dart';
import 'package:my_pet/pages/home_page.dart';
import 'package:my_pet/pages/login_page.dart';
import 'package:my_pet/pages/signup_page.dart';
import 'package:my_pet/pages/toilet_page.dart';
import 'package:my_pet/pages/verification_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    // GetPage(
    //   name: ROUTES.splash,
    //   page: () => const SplashPage(),
    // ),
    GetPage(
      name: ROUTES.home,
      page: () => const HomePage(),
      middlewares: [
        RouteAuthMiddleware(),
      ],
    ),
    GetPage(
      name: ROUTES.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: ROUTES.signup,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: ROUTES.verification,
      page: () => VerificationPage(),
      binding: VerifyBinding(),
      // middlewares: [
      //   RouteAuthMiddleware(),
      // ],
    ),
    GetPage(
      name: ROUTES.toilet,
      page: () => const ToiletPage(),
    ),
    GetPage(
      name: ROUTES.eating,
      page: () => EatingPage(),
      binding: EatingBinding(),
      middlewares: [
        RouteAuthMiddleware(),
      ],
    )
  ];
}
