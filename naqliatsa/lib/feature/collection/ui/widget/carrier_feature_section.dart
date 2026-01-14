import 'package:flutter/material.dart';
import '../../manager/collection_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarrierFeatureSection extends StatefulWidget {
  const CarrierFeatureSection({super.key});

  @override
  State<CarrierFeatureSection> createState() => _CarrierFeatureSectionState();
}

class _CarrierFeatureSectionState extends State<CarrierFeatureSection> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionCubit, CollectionState>(
      buildWhen: (_, current) => current is CarrierSelected,
      builder: (context, state) {
        if (state is CarrierSelected) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.features.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return RadioMenuButton(
                value: index,
                groupValue: _selected,
                onChanged: (val) {
                  setState(() => _selected = val!);
                  context.read<CollectionCubit>().selectFeature(
                    state.features[index],
                  );
                },
                child: Text(state.features[index].name),
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
