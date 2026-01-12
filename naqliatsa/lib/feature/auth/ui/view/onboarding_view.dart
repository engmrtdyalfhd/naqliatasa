import 'package:easy_localization/easy_localization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/constant.dart';
import 'package:naqliatsa/core/helper/extension.dart';
import '../../../../core/common/widget/custom_bot_navbar.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 175,
                    height: 175,
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 32),
                  child: RichText(
                    textAlign: .center,
                    text: TextSpan(
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: .bold,
                      ),
                      text: "${"welcome1".tr()} ",
                      children: [
                        TextSpan(
                          text: "welcome2".tr(),
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                        TextSpan(text: "\n${"welcome3".tr()}"),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                spacing: 16,
                children: [
                  Icon(Iconsax.language_circle),
                  Text(
                    "lang".tr(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        // await context.setLocale(Locale("en"));
                      },
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        alignment: .center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Colors.lightBlue.shade50),
                        ),
                        child: Text("🇺🇸", style: TextStyle(fontSize: 48)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        // await context.setLocale(Locale("ar"));
                      },
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        alignment: .center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Colors.lightBlue.shade50),
                        ),
                        child: Text("🇸🇦", style: TextStyle(fontSize: 48)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavWrapper(
        child: FilledButton(
          onPressed: () {
            context.pushNamed(RoutePath.auth);
          },
          child: Text("continue".tr()),
        ),
      ),
    );
  }
}
