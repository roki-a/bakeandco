import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';

class GlutenFreeMenu extends StatefulWidget {
  const GlutenFreeMenu({super.key});

  @override
  State<GlutenFreeMenu> createState() => _GlutenFreeMenuState();
}

class _GlutenFreeMenuState extends State<GlutenFreeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeDashboard()));
        },
        titleText: "Our Menu",
        actionIcon: Icons.shopping_cart_rounded,
      ),
      
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 1),
    );
  }
}