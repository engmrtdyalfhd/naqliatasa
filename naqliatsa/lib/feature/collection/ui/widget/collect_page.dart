import 'package:flutter/material.dart';
import '../../data/model/truck_model.dart';

class CollectPage extends StatefulWidget {
  final String title;
  final List<TruckModel> data;
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
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.data.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return RadioMenuButton(
          value: index,
          groupValue: _selected,
          onChanged: (val) {
            setState(() => _selected = val!);
          },
          // trailingIcon: Icon(Iconsax.car, size: 32, color: Colors.black),
          child: Text(widget.data[index].truckName),
        );
      },
      // separatorBuilder: (_, _) => const SizedBox(height: 0.5),
    );
  }
}
