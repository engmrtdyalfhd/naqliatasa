import 'package:flutter/material.dart';
import '../../manager/collection_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarrierSection extends StatefulWidget {
  const CarrierSection({super.key});

  @override
  State<CarrierSection> createState() => _CarrierSectionState();
}

class _CarrierSectionState extends State<CarrierSection> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    final read = context.read<CollectionCubit>();
    return BlocBuilder<CollectionCubit, CollectionState>(
      buildWhen: (_, current) => current is TruckSelected,
      builder: (context, state) {
        if (state is TruckSelected) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: read.carriers.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return RadioMenuButton(
                value: index,
                groupValue: _selected,
                onChanged: (val) {
                  setState(() => _selected = val!);
                  context.read<CollectionCubit>().selectCarrier(
                    read.carriers[index],
                  );
                },
                child: Text(read.carriers[index].carrierType),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
