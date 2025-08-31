import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:flutter/material.dart';

import 'confirmation.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyCart()));
        },
        titleText: "Checkout",
        actionIcon: Icons.shopping_cart_rounded,
      ),

    bottomNavigationBar: const Footer(currentIndex: -1), 

      body: MainBg(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ElementColors.primary,
                  ),
                ),
              ),

              Icon(
                Icons.shopping_cart_checkout,
                size: 100,
                color: ElementColors.primary,
              ),
              const SizedBox(height: 20),
              Text(
                "Review your order before placing it.",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ElementColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Make sure everything looks good. Once you place the order, we’ll start preparing it immediately.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7B4720),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Place Order button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // this will trigger the popup
                    Confirmation.show(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ElementColors.primary,
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 4,
                    shadowColor: Colors.black54,
                  ),
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ElementColors.tertiary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
