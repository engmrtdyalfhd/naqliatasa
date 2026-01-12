import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naqliatsa/core/helper/extension.dart';

import '../../../../core/common/widget/custom_bot_navbar.dart';
import '../../../../core/helper/constant.dart';
import '../widget/otp_input.dart';

class VerifyPhone extends StatelessWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            const Text(
              "Enter OTP verification code",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            const Text("The code has been sent to\n+966 12345678"),
            const SizedBox(height: 32),
            const OtpInput(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .center,
              children: [
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 9),
                const Text(
                  "30s",
                  textAlign: .center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 3),
                TextButton(onPressed: () {}, child: Text("Resend")),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWrapper(
        child: FilledButton(
          onPressed: () {
            context.pushNamed(RoutePath.home);
          },
          child: Text("continue".tr()),
        ),
      ),
    );
  }
}
