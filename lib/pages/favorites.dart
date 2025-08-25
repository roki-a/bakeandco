import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
        titleText: "Favorites",
        actionIcon: Icons.shopping_cart_rounded,
      ),
      
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: ElementColors.secondary,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ElementColors.primary),
                boxShadow: [
                  BoxShadow(
                    color: ElementColors.blackShadow.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
      bottomNavigationBar: const Footer(currentIndex: 2),
    );
  }
}