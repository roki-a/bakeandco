import 'package:flutter/material.dart';
import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/menu_tab.dart';
import 'package:bakeandco/common_widget/product_grid.dart';
import 'package:bakeandco/data/menu_data.dart';
import 'package:bakeandco/pages/home.dart';

class BreadMenu extends StatelessWidget {
  const BreadMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(157),
        child: Column(
          children: [
            Header(
              height: 100,
              showLeading: true,
              titleText: "Our Menu",
              actionIcon: Icons.shopping_cart_rounded,
              onLeadingTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeDashboard(),
                  ),
                );
              },
            ),
            const MenuTab(currentTab: 1),
          ],
        ),
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: ProductGrid(
                    products: bread,
                    itemLimit: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 1),
    );
  }
}
