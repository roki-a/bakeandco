import 'package:flutter/material.dart';
import 'package:bakeandco/common_style/color_extension.dart';

class Recommendations extends StatelessWidget {
  final String currentItem;

  const Recommendations({super.key, required this.currentItem});

  final List<Map<String, String>> menuItems = const [
  {"title": "Baked Oatmeal", "image": "assets/images/menu/baked_oatmeal.jpg"},
  {"title": "Banana Bread", "image": "assets/images/menu/banana_bread.jpg"},
  {"title": "Blueberry Pie", "image": "assets/images/menu/blueberry_pie.jpg"},
  {"title": "Blueberry Sauce Topping", "image": "assets/images/menu/blueberry_sauce_topping.jpg"},
  {"title": "Brioche", "image": "assets/images/menu/brioche.jpg"},
  {"title": "Chocolate Soufflé", "image": "assets/images/menu/chocolate_souffle.jpg"},
  {"title": "Cinnamon Roll", "image": "assets/images/menu/cinnamon_roll.jpg"},
  {"title": "Custard Pastries with Blueberry & Strawberries", "image": "assets/images/menu/custard_pastries_with_blueberry_and_strawberries.jpeg"},
  {"title": "Egg Tart", "image": "assets/images/menu/egg_tart.webp"},
  {"title": "Ensaymada", "image": "assets/images/menu/ensaymada.jpg"},
  {"title": "Flourless Chocolate Cake Slice", "image": "assets/images/menu/flourless_chocolate_cake_slice.jpg"},
  {"title": "GF Almond Butter Coconut Macaroons", "image": "assets/images/menu/gf_almond_butter_coconut_macaroons.jpg"},
  {"title": "Healthy Chocolate Chip Baked Oatmeal Cups", "image": "assets/images/menu/healthy_chocolate_chip_baked_oatmeal_cups.jpg"},
  {"title": "Homemade Strawberry Cream Cheese Pie", "image": "assets/images/menu/homemade_strawberry_cream_cheese_pie.jpg"},
  {"title": "Japanese Milk Bread", "image": "assets/images/menu/japanese_milk_bread.jpg"},
  {"title": "Lace Cookies", "image": "assets/images/menu/lace_cookies.jpg"},
  {"title": "No-Bake Energy Bites", "image": "assets/images/menu/nobake_energy_bites.jpg"},
  {"title": "Pecan Pie", "image": "assets/images/menu/pecan_pie.jpeg"},
  {"title": "Pumpkin Crumb Cake", "image": "assets/images/menu/pumpkin_crumb_cake.jpg"},
  {"title": "Raisin Loaf Bread", "image": "assets/images/menu/raisin_loaf_bread.jpg"},
  {"title": "Strawberry Cupcakes with Strawberry Buttercream Frosting", "image": "assets/images/menu/strawberry_cupcakes_with_strawberry_buttercream_frosting.jpg"},
  {"title": "Vegan Garlic Bread", "image": "assets/images/menu/vegan_garlic_bread.jpeg"},
  {"title": "Vegan Kanafe", "image": "assets/images/menu/vegan_kanafe.jpeg"},
  {"title": "Vegan Quesitos", "image": "assets/images/menu/vegan_quesitos.jpeg"},
  {"title": "Vegan Spinach Cheese Börek", "image": "assets/images/menu/vegan_spinach_cheese_borek.jpeg"},
];


  List<Map<String, String>> getRecommendations(String currentItem) {
    final filtered = List<Map<String, String>>.from(menuItems);
    filtered.removeWhere((item) => item["title"] == currentItem); // exclude current item
    filtered.shuffle();
    return filtered.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          height: 180,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: getRecommendations(currentItem).map((rec) {
              return _buildRecommendation(
                rec["title"]!,
                rec["image"]!,
                MediaQuery.of(context).size.width * 0.35,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendation(
    String title,
    String imagePath,
    double cardWidth,
  ) {
    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 120,
              width: cardWidth,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
