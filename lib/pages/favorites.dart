import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:bakeandco/pages/products.dart';
import 'package:flutter/material.dart';

// Favorites data manager
class FavoritesData {
  static final List<Map<String, dynamic>> _favorites = [];

  static void toggleFavorite(Map<String, dynamic> item) {
    if (isFavorite(item)) {
      _favorites.removeWhere((fav) => fav["title"] == item["title"]);
    } else {
      _favorites.add(item);
    }
  }

  static bool isFavorite(Map<String, dynamic> item) {
    return _favorites.any((fav) => fav["title"] == item["title"]);
  }

  static List<Map<String, dynamic>> get favorites =>
      List.unmodifiable(_favorites);
}

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
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context, CustomPageRoute(page: const ClassicsMenu()));
        },
        titleText: "Favorites",
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {
          Navigator.push(context, CustomPageRoute(page: const MyCart()));
        },
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          Positioned.fill(
            child: FavoritesData.favorites.isEmpty
                ? Center(
                    child: Text(
                      "No Favorites Yet!",
                      style: TextStyle(
                        color: ElementColors.blackShadow.withOpacity(0.1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 0,
                            childAspectRatio: 0.75,
                          ),
                      itemCount: FavoritesData.favorites.length,
                      itemBuilder: (context, index) {
                        final item = FavoritesData.favorites[index];
                        return _buildFavoriteGridItem(item);
                      },
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 2),
    );
  }

  Widget _buildFavoriteGridItem(Map<String, dynamic> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            // This is the GestureDetector that makes the image clickable
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(page: ProductPage(item: item)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ElementColors.primary, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    item["image"],
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    FavoritesData.toggleFavorite(item);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    FavoritesData.isFavorite(item)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: FavoritesData.isFavorite(item)
                        ? ElementColors.favorite
                        : ElementColors.blackShadow.withOpacity(0.1),
                    size: 33,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            item["title"],
            style: TextStyle(
              color: ElementColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
