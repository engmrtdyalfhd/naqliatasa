import '../../feature/auth/ui/view/verify_phone.dart';
import '../../feature/home/ui/view/home_view.dart';
import 'constant.dart';
import 'package:flutter/material.dart';
import 'custom_page_route.dart';
import '../../feature/auth/ui/view/onboarding_view.dart';
import '../../feature/auth/ui/view/register_view.dart';

// ! _____ App Routes Here (OnGenerate Approach) _____ ! //
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.onboarding:
        return CustomPageRoute(
          child: const OnboardingView(),
          // builder: (_) => const OnboardingView(),
        );
      case RoutePath.auth:
        return CustomPageRoute(
          child: const RegisterView(),
          // builder: (_) => const OnboardingView(),
        );
      case RoutePath.verify_phone:
        return CustomPageRoute(
          child: const VerifyPhone(),
          // builder: (_) => const OnboardingView(),
        );
      case RoutePath.home:
        return CustomPageRoute(
          child: const HomeView(),
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
