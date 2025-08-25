import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/category_card.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/profile.dart';
import 'package:flutter/material.dart';

class RecentlyViewed extends StatefulWidget {
  const RecentlyViewed({super.key});

  @override
  State<RecentlyViewed> createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
        },
        titleText: "My Profile - Recently Viewed",
        actionIcon: Icons.shopping_cart_rounded,
      ),
      
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ProfileBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Viewed",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ElementColors.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildRecentItem("Cinnamon Roll",
                              "assets/images/menu/cinnamon_roll.jpg"),
                          _buildRecentItem("Ensaymada",
                              "assets/images/menu/ensaymada.jpg"),
                          _buildRecentItem("Chocolate Souffle",
                              "assets/images/menu/chocolate_souffle.jpg"),
                        ],
                      ),]
                  ),
                ),
              ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 3),
    );
  }
}

Widget _buildRecentItem(String title, String imagePath) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: ElementColors.primary),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }