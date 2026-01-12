import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theme/colory.dart';

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({super.key});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String selectedCode = '+966';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final code = await showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          builder: (_) => const CountryCodeBottomSheet(),
        );

        if (code != null) {
          setState(() {
            selectedCode = code;
          });
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colory.lightBg,
          border: Border.all(color: Colors.lightBlue.shade50),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          spacing: 16,
          children: [Text(selectedCode), Icon(Iconsax.arrow_down_1, size: 16)],
        ),
      ),
    );
  }
}

class CountryCodeBottomSheet extends StatelessWidget {
  const CountryCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, String>> countries = [
      {'name': 'Saudi Arabia', 'code': '+966', 'flag': '🇸🇦'},
      {'name': 'Egypt', 'code': '+20', 'flag': '🇪🇬'},
      // {'name': 'UAE', 'code': '+971', 'flag': '🇦🇪'},
      // {'name': 'USA', 'code': '+1', 'flag': '🇺🇸'},
    ];

    return SafeArea(
      child: Column(
        mainAxisSize: .min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Select country",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: countries.length,
              separatorBuilder: (_, _) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final country = countries[index];

                return ListTile(
                  leading: Text(
                    country['flag']!,
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Text(country['name']!, style: TextStyle(fontSize: 13)),
                  trailing: Text(
                    country['code']!,
                    style: TextStyle(fontSize: 13),
                  ),
                  onTap: () {
                    Navigator.pop(context, country['code']);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
