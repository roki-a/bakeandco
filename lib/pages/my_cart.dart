import 'dart:ui';

import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  static final List<Map<String, dynamic>> cartItems = [];

  static void addToCart(Map<String, dynamic> item, int quantity) {
    int index = cartItems.indexWhere(
      (element) => element['title'] == item['title'],
    );
    if (index != -1) {
      cartItems[index]['quantity'] =
          (cartItems[index]['quantity'] ?? 0) + quantity;
    } else {
      cartItems.add({...item, 'quantity': quantity});
    }
  }

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  void _updateQuantity(Map<String, dynamic> item, int change) {
    setState(() {
      final index = MyCart.cartItems.indexWhere(
        (element) => element['title'] == item['title'],
      );
      if (index != -1) {
        final currentQuantity = MyCart.cartItems[index]['quantity'] ?? 0;
        final newQuantity = currentQuantity + change;

        if (newQuantity > 0) {
          MyCart.cartItems[index]['quantity'] = newQuantity;
        } else {
          MyCart.cartItems.removeAt(index);
        }
      }
    });
  }

  double get _subtotal {
    double total = 0.0;
    for (var item in MyCart.cartItems) {
      total += (item['price'] ?? 0.0) * (item['quantity'] ?? 0);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        titleText: "My Cart",
        onLeadingTap: () => Navigator.pop(context),
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {},
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          Positioned.fill(
            child: MyCart.cartItems.isEmpty
                ? const Center(
                    child: Text(
                      "Your cart is empty!",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 20.0,
                          ),
                          itemCount: MyCart.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = MyCart.cartItems[index];
                            return _buildCartItem(item);
                          },
                        ),
                      ),
                      _buildCartSummary(),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: -1),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ElementColors.secondary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ElementColors.primary, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Radio(
            value: true,
            groupValue: true,
            onChanged: (bool? value) {},
            activeColor: ElementColors.primary,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item["image"],
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ElementColors.primary,
                  ),
                ),
                Text(
                  item["category"] ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: ElementColors.primary.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "₱${(item["price"] ?? 0.0).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ElementColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: ElementColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  color: ElementColors.secondary,
                  onPressed: () => _updateQuantity(item, -1),
                ),
                Text(
                  (item["quantity"] ?? 1).toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: ElementColors.secondary,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  color: ElementColors.secondary,
                  onPressed: () => _updateQuantity(item, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
            color: ElementColors.tertiary.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: ElementColors.tertiary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: ElementColors.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 16,
                        color: ElementColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "₱${_subtotal.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ElementColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ElementColors.primary,
                  foregroundColor: ElementColors.tertiary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.1),
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
