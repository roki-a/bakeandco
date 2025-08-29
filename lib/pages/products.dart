import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/recommendations.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/favorites.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const ProductPage({super.key, required this.item});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void _toggleFavorite() {
    setState(() {
      FavoritesData.toggleFavorite(widget.item);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            FavoritesData.isFavorite(widget.item)
                ? "${widget.item["title"]} added to favorites"
                : "${widget.item["title"]} removed from favorites",
            style: TextStyle(color: ElementColors.tertiary),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: ElementColors.primary,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        showLeading: true,
        titleText: "Our Menu",
        actionIcon: Icons.shopping_cart_rounded,
        onLeadingTap: () {
          Navigator.push(context, CustomPageRoute(page: ClassicsMenu()));
        },
        onActionTap: () {
          Navigator.push(context, CustomPageRoute(page: MyCart()));
        },
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Image
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ElementColors.blackShadow.withOpacity(0.1),
                        image: widget.item["image"] != null
                            ? DecorationImage(
                                image: AssetImage(widget.item["image"]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          icon: Icon(
                            FavoritesData.isFavorite(widget.item)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: ElementColors.favorite,
                          ),
                          iconSize: 36,
                          onPressed: _toggleFavorite,
                        ),
                      ),
                    ),
                  ],
                ),

                // Product Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ElementColors.secondary,
                    border: Border.all(color: ElementColors.primary),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.item["title"] ?? "",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: ElementColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          // Quantity controls
                          Container(
                            decoration: BoxDecoration(
                              color: ElementColors.primary,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: ElementColors.primary),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  iconSize: 16,
                                  color: ElementColors.secondary,
                                  onPressed: _decreaseQuantity,
                                ),
                                Text(
                                  "$quantity",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: ElementColors.secondary,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  iconSize: 16,
                                  color: ElementColors.secondary,
                                  onPressed: _increaseQuantity,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Price
                      Text(
                        "₱${widget.item["price"]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ElementColors.primary,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Description
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ElementColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.item["description"] ??
                            "No description available.",
                        style: TextStyle(
                          fontFamily: 'Alice',
                          fontSize: 12,
                          color: ElementColors.primary,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),

                // Recommendations Section
                Recommendations(currentItem: widget.item["title"]),

                // Ratings & Reviews
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ElementColors.secondary,
                    border: Border.all(color: ElementColors.primary),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ratings & Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ElementColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Name of Customer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ElementColors.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star_half, color: Colors.amber, size: 16),
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),

                const SizedBox(height: 70),
              ],
            ),
          ),

          // Bottom bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: ElementColors.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ElementColors.blackShadow.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: ₱${(widget.item["price"] ?? 0) * quantity}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ElementColors.primary,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      MyCart.addToCart(widget.item, quantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Added ${widget.item['title']} to cart!",
                            style: TextStyle(color: ElementColors.tertiary),
                          ),
                          backgroundColor: ElementColors.primary,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart, size: 28),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ElementColors.primary,
                      foregroundColor: ElementColors.tertiary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 17,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 1),
    );
  }
}
