import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_launcher/url_launcher.dart';

import 'extension.dart';

Future<void> initMain() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
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
