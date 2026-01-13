import '../widget/indicator.dart';
import '../widget/collect_page.dart';
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
      appBar: AppBar(
        title: const Text("Setup your account"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("${_index + 1} / 3"),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (val) => setState(() => _index = val),
        children: [
          const CollectPage(data: [], title: "Select a car type to continue"),
          const CollectPage(
            data: [],
            title: "Select the expected load to continue",
          ),
          const CollectPage(data: [], title: "Select a car type to continue"),
        ],
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
