import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/category_card.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/profile.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
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
        titleText: "My Profile - Reviews",
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
                            "Reviews",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ElementColors.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildReviewItem("Product Name", 5),
                      _buildReviewItem("Product Name", 4),
                    ],
                  ),
                ),
              ),
            ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 3),
      );
  }
}

  Widget _buildReviewItem(String product, int stars) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: ElementColors.tertiary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ElementColors.primary.withOpacity(0.4)),
      boxShadow: [
        BoxShadow(
          color: ElementColors.blackShadow.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(2, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ElementColors.primary,
              ),
            ),
            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  i < stars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          thickness: 1,
          color: ElementColors.primary, // matches your UI style
        ),
        const SizedBox(height: 8),
        Container(
          height: 10, // empty lines for review text
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.brown, width: 1),
              bottom: BorderSide(color: Colors.brown, width: 1),
            ),
          ),
        ),
      ],
    ),
  );
  }