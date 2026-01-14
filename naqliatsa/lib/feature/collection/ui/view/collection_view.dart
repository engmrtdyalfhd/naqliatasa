import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widget/loading_progress.dart';
import '../../manager/collection_cubit.dart';
import '../widget/collect_page.dart';
import '../widget/indicator.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widget/bottom_nav_wrapper.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({super.key});

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  int _index = 0;
  late final PageController _controller;

  Future<void> _animatePage(int index) async {
    if (index >= 0 && index < 3) {
      setState(() => _index = index);
      await _controller.animateToPage(
        index,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CollectionCubit>().getCollectionData();
    _controller = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setup your account")),
      body: BlocBuilder<CollectionCubit, CollectionState>(
        builder: (_, state) {
          if (state is CollectionSuccess) {
            return PageView(
              controller: _controller,
              onPageChanged: (val) => setState(() => _index = val),
              children: [
                CollectPage(
                  data: state.collectionData.en,
                  title: "Select a car type to continue",
                ),
                CollectPage(
                  data: state.collectionData.en,
                  title: "Select a carrier type to continue",
                ),
                CollectPage(
                  data: state.collectionData.en,
                  title: "Select a carrier feature to continue",
                ),
              ],
            );
          } else if (state is CollectionFailure) {
            return Center(child: Text(state.error));
          } else {
            return const LoadingProgress();
          }
        },
      ),
      bottomNavigationBar: BottomNavWrapper(
        child: Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextButton(
                onPressed: _index > 0
                    ? () {
                        _animatePage(_index - 1);
                      }
                    : null,
                child: const Text("Prev"),
              ),
            ),
            Flexible(
              child: Wrap(
                children: List.generate(
                  3,
                  (i) => GestureDetector(
                    onTap: () => _animatePage(i),
                    child: Indicator(_index != i),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  if (_index < 3 - 1) _animatePage(_index + 1);
                },
                child: Text(_index < 3 - 1 ? "Next" : "Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
