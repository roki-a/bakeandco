import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/menu_tab.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';

class BreadMenu extends StatefulWidget {
  const BreadMenu({super.key});

  @override
  State<BreadMenu> createState() => ClassicsMenuState();
}

class ClassicsMenuState extends State<BreadMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(157), // Header + Tabs
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
            const MenuTab(currentTab: 1), // Classics selected
          ],
        ),
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          Center(
            child: Text(
              "Bread Menu Content Here",
              style: TextStyle(fontSize: 18, color: ElementColors.primary),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 1),
    );
  }
}
