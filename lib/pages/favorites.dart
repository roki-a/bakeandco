import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/my_cart.dart';
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
          Navigator.push(context, CustomPageRoute(page: ClassicsMenu()));
        },
        titleText: "Favorites",
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {
          Navigator.push(context, CustomPageRoute(page: MyCart()));
        },
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
              child: FavoritesData.favorites.isEmpty
                  ? const Center(
                      child: Text(
                        "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Column(
                      children: FavoritesData.favorites.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item["image"],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["title"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "₱${item["price"]}",
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 2),
    );
  }
}
