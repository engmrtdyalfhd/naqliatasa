import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/truck_model.dart';
import '../../manager/collection_cubit.dart';

class TruckSection extends StatefulWidget {
  final List<TruckModel> trucks;

  const TruckSection({super.key, required this.trucks});

  @override
  State<TruckSection> createState() => _TruckSectionState();
}

class _TruckSectionState extends State<TruckSection> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.trucks.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return RadioMenuButton(
          value: index,
          groupValue: _selected,
          onChanged: (val) => _onChanged(context, index),
          child: Text(widget.trucks[index].truckName),
        );
      },
    );
  }

  void _onChanged(BuildContext context, int index) {
    context.read<CollectionCubit>().selectTruck(widget.trucks[index]);
    setState(() => _selected = index);
  }
}
