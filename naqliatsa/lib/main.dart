import 'package:flutter/material.dart';

import 'core/helper/constant.dart';
import 'core/routes/app_route.dart';

void main() {
  runApp(const NaqliatKSA());
}

class NaqliatKSA extends StatelessWidget {
  const NaqliatKSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naqliat KSA',
      initialRoute: RoutePath.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
