import 'package:flutter/material.dart';

class CollectPage extends StatefulWidget {
  final String title;
  final List data;
  final bool hasIcon;

  const CollectPage({
    super.key,
    required this.title,
    required this.data,
    this.hasIcon = false,
  });

  @override
  State<CollectPage> createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: .w400)),
        const SizedBox(height: 16),
        ListView.separated(
          itemCount: widget.data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return RadioMenuButton(
              value: widget.data[index],
              groupValue: _selected,
              onChanged: (val) {
                setState(() => _selected = val!);
              },
              // trailingIcon: Icon(Iconsax.car, size: 32, color: Colors.black),
              child: Text(widget.data[index]),
            );
          },
          separatorBuilder: (_, _) => const SizedBox(height: 6),
        ),
      ],
    );
  }
}
