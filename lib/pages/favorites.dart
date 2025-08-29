import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/classics_menu.dart';
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
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ClassicsMenu()),
          );
        },
        titleText: "Favorites",
        actionIcon: Icons.shopping_cart_rounded,
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          Positioned.fill(
            child: FavoritesData.favorites.isEmpty
                ? const Center(
                    child: Text(
                      "No Favorites Yet!",
                      style: TextStyle(
                        color: Colors.black54,
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Column
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 30.0,
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ElementColors.primary, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 3,
                    offset: const Offset(-4, 4),
                  ),
                ],
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
                    color: Colors.red,
                    size: 33,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            item["title"],
            style: TextStyle(
              color: ElementColors.primary,
              fontSize: 17,
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
