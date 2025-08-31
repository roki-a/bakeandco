import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/pages/favorites.dart';
import 'package:bakeandco/pages/products.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final int? itemLimit;

  const ProductGrid({
    super.key,
    required this.products,
    this.itemLimit,
  });

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  void _toggleFavorite(Map<String, dynamic> item) {
    setState(() {
      FavoritesData.toggleFavorite(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          FavoritesData.isFavorite(item)
              ? "${item["title"]} added to favorites"
              : "${item["title"]} removed from favorites",
          style: TextStyle(color: ElementColors.tertiary),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: ElementColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayCount = widget.itemLimit == null
        ? widget.products.length
        : (widget.itemLimit! < widget.products.length
            ? widget.itemLimit!
            : widget.products.length);

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.all(2),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          itemCount: displayCount,
          itemBuilder: (context, index) {
            final item = widget.products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(page: ProductPage(item: item)),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        // 📷 Product Image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: ElementColors.primary, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: ElementColors.black.withOpacity(0.1),
                                blurRadius: 3,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item["image"],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),

                        // ❤️ Favorite Button
                        Positioned(
                          bottom: 12,
                          right: 8,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black.withOpacity(0.3),
                            child: IconButton(
                              padding: const EdgeInsets.only(top: 2, left: 1),
                              iconSize: 25,
                              icon: Icon(
                                FavoritesData.isFavorite(item)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: ElementColors.favorite,
                              ),
                              onPressed: () => _toggleFavorite(item),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item["title"],
                    style: TextStyle(
                      color: ElementColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "₱${item["price"]}",
                    style: TextStyle(
                      fontSize: 12,
                      color: ElementColors.primary,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
