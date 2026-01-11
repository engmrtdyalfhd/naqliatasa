import '../helper/constant.dart';
import 'package:flutter/material.dart';
import '../helper/custom_page_route.dart';
import '../../feature/auth/ui/view/login_view.dart';

// ! _____ App Routes Here (OnGenerate Approach) _____ ! //
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.login:
        return CustomPageRoute(
          child: const LoginView(),
          // builder: (_) => const OnboardingView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}
