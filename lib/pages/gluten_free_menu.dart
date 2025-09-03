import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/menu_tab.dart';
import 'package:bakeandco/common_widget/product_grid.dart';
import 'package:bakeandco/data/menu_data.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:flutter/material.dart';

class GlutenFreeMenu extends StatelessWidget {
  const GlutenFreeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              titleText: "Our Menu",
              actionIcon: Icons.shopping_cart_rounded,
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
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: 16,
              right: 16,
            ),
            child: ProductGrid(
              products: glutenFree,
              itemLimit: 4,
            ),
            
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 1),
    );
  }
}