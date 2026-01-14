import '../widget/collect_page.dart';
import 'package:flutter/material.dart';
import '../../manager/collection_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({super.key});

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    context.read<CollectionCubit>().getCollectionData(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setup your account")),
      body: BlocBuilder<CollectionCubit, CollectionState>(
        buildWhen: (previous, current) {
          return current is CollectionFailure || current is CollectionSuccess;
        },
        builder: (_, state) {
          if (state is CollectionSuccess) {
            return Stepper(
              currentStep: _index,
              // onStepTapped: (val) => setState(() => _index = val),
              // onStepContinue: () {
              //   if (_index < 2) {
              //     setState(() => _index++);
              //   }
              // },
              // onStepCancel: () => _index > 0 ? setState(() => _index--) : null,
              steps: [
                Step(
                  isActive: _index >= 0,
                  title: const Text("Truck"),
                  subtitle: const Text("Select a car type to continue"),
                  content: CollectPage(title: '', data: state.trucks),
                ),
                Step(
                  isActive: _index >= 1,
                  title: const Text("Carrier"),
                  subtitle: const Text("Select a carrier type to continue"),
                  content: CollectPage(title: '', data: state.trucks),
                ),
                Step(
                  isActive: _index >= 2,
                  title: const Text("Feature"),
                  subtitle: const Text("Select a carrier feature to continue"),
                  content: CollectPage(title: '', data: state.trucks),
                ),
              ],
            );
            // return PageView(
            //   controller: _controller,
            //   onPageChanged: (val) => setState(() => _index = val),
            //   children: [
            //     CollectPage(
            //       data: state.trucks,
            //       title: "Select a car type to continue",
            //     ),
            //     CollectPage(
            //       data: state.trucks,
            //       title: "Select a carrier type to continue",
            //     ),
            //     CollectPage(
            //       data: state.trucks,
            //       title: "Select a carrier feature to continue",
            //     ),
            //   ],
            // );
          } else if (state is CollectionFailure) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
