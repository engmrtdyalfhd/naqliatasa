import 'extension.dart';
import '../../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'service_locator.dart';

Future<void> initMain() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  serviceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  FlutterNativeSplash.remove();
}

Future<void> whatsapp(
  BuildContext context, [
  String phoneNumber = "+967773365712",
]) async {
  showConfirmationAlert(
    context: context,
    title: "Customer Support",
    content: "You will be redirected to WhatsApp.\nDo you want to continue?",
    onConfirm: () async {
      final url = "https://wa.me/$phoneNumber";
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    },
  );
}
