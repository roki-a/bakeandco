import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
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
            child: CustomBox(
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
                          color: ElementColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  _buildReviewItem("Egg Tart", 5,
                      "I love Perfectly flaky crust with a smooth and creamy custard filling. Not too sweet, just right for a light treat."),
                  _buildReviewItem("Strawberry Cupcake", 4,
                      "Soft and moist cake with a refreshing strawberry flavor. The frosting is sweet but not overpowering. Great for strawberry lovers!"),
                  _buildReviewItem("Cinnamon Roll", 3,
                      "Warm, fluffy, and full of cinnamon goodness. The glaze melts perfectly into the roll—absolutely comforting and delicious."),
                  _buildReviewItem("Pumpkin Coffee Cake", 5,
                      "Moist and flavorful with a hint of pumpkin spice. The crumb topping adds the perfect crunch—pairs wonderfully with coffee."),
                  _buildReviewItem("Ensaymada", 3,
                      "Soft, buttery, and fluffy with just the right sweetness. The cheese topping balances the flavor perfectly—a true comfort pastry."),
                ],
              ),

                ),
              ),
            ],
      ),
      bottomNavigationBar: Footer(currentIndex: 3),
      );
  }
}

        Widget _buildReviewItem(String product, int stars, String reviewText) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ElementColors.tertiary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ElementColors.primary),
            boxShadow: [
              BoxShadow(
                color: ElementColors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product + stars row
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
                        color: ElementColors.starColor,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // review text
              Text(
                reviewText,
                style: TextStyle(
                  fontSize: 11,
                  color: ElementColors.primary,
                ),
              ),
            ],
          ),
        );
      }


