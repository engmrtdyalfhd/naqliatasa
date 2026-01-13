import '../../feature/collection/data/collection_repo.dart';
import '../../feature/collection/manager/collection_cubit.dart';
import '../../feature/collection/ui/view/collection_view.dart';
import 'constant.dart';
import 'auth_gate.dart';
import 'custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/ui/view/login_view.dart';
import '../../feature/auth/manager/auth_cubit.dart';
import '../../feature/settings/view/profile_view.dart';
import '../../feature/auth/ui/view/verify_phone_view.dart';
import 'service_locator.dart';

// ! _____ App Routes Here (OnGenerate Approach) _____ ! //
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.authGate:
        return CustomPageRoute(child: const AuthGate());
      case RoutePath.login:
        return CustomPageRoute(
          child: BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(),
            child: const LoginView(),
          ),
        );
      case RoutePath.verifyPhone:
        return CustomPageRoute(child: const VerifyPhoneView());
      case RoutePath.collection:
        return CustomPageRoute(
          child: BlocProvider<CollectionCubit>(
            create: (context) =>
                CollectionCubit(getIt.get<CollectionRepoImpl>()),
            child: const CollectionView(),
          ),
        );
      case RoutePath.profile:
        return CustomPageRoute(child: const ProfileView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}
