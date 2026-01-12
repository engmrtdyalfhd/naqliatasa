import 'core/helper/init.dart';
import 'core/helper/constant.dart';
import 'core/helper/app_route.dart';
import 'core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  await initMain();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      startLocale: Locale('ar'),
      fallbackLocale: Locale('en'),
      child: NaqliatKSA(),
    ),
  );
}

class NaqliatKSA extends StatelessWidget {
  const NaqliatKSA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naqliat KSA',
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      // ? Routes
      initialRoute: RoutePath.onboarding,
      onGenerateRoute: AppRoutes.generateRoute,
      // ? Localization settings
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
