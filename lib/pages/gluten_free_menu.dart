import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/menu_tab.dart';
import 'package:bakeandco/common_widget/product_grid.dart';
import 'package:bakeandco/data/menu_data.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:flutter/material.dart';

class GlutenFreeMenu extends StatelessWidget {
  const GlutenFreeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(157),
        child: Column(
          children: [
            Header(
              showLeading: true,
              titleText: "Our Menu",
              actionIcon: Icons.shopping_cart_rounded,
              onLeadingTap: () {
                Navigator.push(context, CustomPageRoute(page: HomeDashboard()));
              },
              onActionTap: () {
                Navigator.push(context, CustomPageRoute(page: MyCart()));
              },
            ),
            const MenuTab(currentTab: 3),
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
                    products: glutenFree,
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
