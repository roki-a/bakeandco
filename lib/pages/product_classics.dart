import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/favorites.dart';
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
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Header(
          height: 100,
          showLeading: true,
          titleText: "Our Menu",
          actionIcon: Icons.shopping_cart_rounded,
          onLeadingTap: () => Navigator.pop(context),
        ),
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
                        color: Colors.grey[300],
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
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            FavoritesData.isFavorite(widget.item)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: _toggleFavorite,
                        ),
                      ),
                    ),
                  ],
                ),

                // Product Title and Rating
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item["title"] ?? "",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
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
                      // Quantity buttons
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
                              color: ElementColors.secondary,
                              onPressed: _decreaseQuantity,
                            ),
                            Text(
                              "$quantity",
                              style: TextStyle(
                                fontSize: 15,
                                color: ElementColors.secondary,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              color: ElementColors.secondary,
                              onPressed: _increaseQuantity,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "₱${widget.item["price"]}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ElementColors.primary,
                    ),
                  ),
                ),

                // Description
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ElementColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    widget.item["description"] ?? "No description available.",
                    style: TextStyle(
                      fontSize: 11,
                      color: ElementColors.primary,
                    ),
                  ),
                ),

                // Recommendations
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Recommendations",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ElementColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildRecommendation(
                        "Cinnamon Roll",
                        "assets/images/menu/cinnamon_roll.jpg",
                      ),
                      _buildRecommendation(
                        "Cinnamon Roll",
                        "assets/images/menu/cinnamon_roll.jpg",
                      ),
                      _buildRecommendation(
                        "Cinnamon Roll",
                        "assets/images/menu/cinnamon_roll.jpg",
                      ),
                    ],
                  ),
                ),

                // Ratings & Reviews
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Ratings & Reviews",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ElementColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const SizedBox(height: 4),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          // Bottom bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              decoration: BoxDecoration(
                color: ElementColors.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: ₱${(widget.item["price"] ?? 0) * quantity}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ElementColors.primary,
                      foregroundColor: ElementColors.tertiary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
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

  Widget _buildRecommendation(String title, String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 80,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
