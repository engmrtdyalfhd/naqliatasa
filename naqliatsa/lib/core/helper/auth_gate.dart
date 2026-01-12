import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../feature/home/ui/view/home_view.dart';
import '../../feature/auth/ui/view/onboarding_view.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == null) {
          return const OnboardingView();
        }

        return const HomeView();
      },
    );
  }
}
