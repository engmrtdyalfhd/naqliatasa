import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/utils.dart';
import '../../../../core/helper/constant.dart';
import '../../../../core/helper/extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () => context.pushNamed(RoutePath.profile),
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.blue.shade100),
                ),
              ),
              icon: Icon(Iconsax.setting_2),
            ),
          ),
        ],
        title: Image.asset(ImgPath.logo, width: 64, height: 64),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text("My Fleet", style: TextStyle(fontSize: 16, fontWeight: .w500)),
            const SizedBox(height: 6),

            const SizedBox(height: 6),
            ListTile(
              leading: const Icon(Iconsax.document),
              title: const Text('History'),
              subtitle: Text("Laboris et amet culpa dolore minim."),
              onTap: () {},
            ),
            const SizedBox(height: 6),
            ListTile(
              leading: const Icon(Iconsax.location),
              title: const Text('Location'),
              subtitle: Text("Laboris et amet culpa dolore minim."),
              onTap: () {},
            ),
            const SizedBox(height: 6),
            ListTile(
              leading: const Icon(Iconsax.search_favorite),
              title: const Text('Search'),
              subtitle: Text("Laboris et amet culpa dolore minim."),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => await whatsapp(context),
        label: const Text("Support"),
        icon: const Icon(Iconsax.headphone),
      ),
    );
  }
}
