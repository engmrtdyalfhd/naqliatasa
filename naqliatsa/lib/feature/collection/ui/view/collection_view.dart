import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Setup your account"),
        leading: Icon(Iconsax.user_edit),
      ),
      body: PageView(
        children: [
          const CollectionPage(),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            "Select a car type to get started",
            style: TextStyle(fontSize: 16, fontWeight: .w400),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.lightBlue.shade100),
                    ),
                    child: Column(
                      spacing: 16,
                      mainAxisAlignment: .center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Iconsax.car, size: 56),
                        Flexible(
                          child: Text(
                            "Car Name $index",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13, fontWeight: .w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
