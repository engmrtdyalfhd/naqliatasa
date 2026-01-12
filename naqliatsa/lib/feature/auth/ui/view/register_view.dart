import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naqliatsa/core/helper/extension.dart';
import '../../../../core/common/widget/input.dart';
import '../../../../core/helper/constant.dart';
import '../widget/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/common/widget/custom_bot_navbar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController phoneController;
  // AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login".tr())),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                "login_hint1".tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text("login_hint2".tr()),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: .start,
                spacing: 9,
                children: [
                  Column(
                    spacing: 6,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "country".tr(),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const CountryCodePicker(),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      spacing: 6,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "phone".tr(),
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        Form(
                          key: _formKey,
                          // autovalidateMode: _autovalidate,
                          child: Input(
                            validator: _validatePhone,
                            hint: 'phone_number'.tr(),
                            prefix: Iconsax.mobile,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
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
            context.pushNamed(RoutePath.verify_phone);
            // if (_formKey.currentState!.validate()) {
            //   context.pushNamed(RoutePath.verify_phone);
            // } else {
            //   setState(() {
            //     _autovalidate = AutovalidateMode.always;
            //   });
            // }
          },
          child: Text("continue".tr()),
        ),
      ),
    );
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\+?[0-9]{8,15}$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
