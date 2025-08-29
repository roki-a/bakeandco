// import 'package:flutter/material.dart';
// import 'package:bakeandco/common_style/color_extension.dart';
// import 'package:bakeandco/common_widget/custom_page_route.dart';
// import 'package:bakeandco/pages/products.dart';
// import 'package:bakeandco/data/menu_data.dart';

// class Recommendations extends StatefulWidget {
//   final String currentItem;

//   const Recommendations({super.key, required this.currentItem});

//   @override
//   State<Recommendations> createState() => _RecommendationsState();
// }

// // final List<Map<String, String>> menuItems = [
// //   {
// //     "title": "Baked Oatmeal",
// //     "image": "assets/images/menu/baked_oatmeal.jpg",
// //     "description":
// //         "A warm, comforting dish made with oats, milk, and brown sugar, baked to a perfect golden brown.",
// //   },
// //   {
// //     "title": "Banana Bread",
// //     "image": "assets/images/menu/banana_bread.jpg",
// //     "description":
// //         "A moist and flavorful bread, packed with ripe banana sweetness and a hint of cinnamon.",
// //   },
// //   {
// //     "title": "Blueberry Pie",
// //     "image": "assets/images/menu/blueberry_pie.jpg",
// //     "description":
// //         "A classic pie with a flaky crust and a sweet, juicy filling of fresh blueberries.",
// //   },
// //   {
// //     "title": "Brioche",
// //     "image": "assets/images/menu/brioche.jpg",
// //     "description":
// //         "A light, tender, and rich French bread with a delicate crumb and a beautiful golden crust.",
// //   },
// //   {
// //     "title": "Chocolate Soufflé",
// //     "image": "assets/images/menu/chocolate_souffle.jpg",
// //     "description":
// //         "A decadent and airy dessert that rises beautifully, offering a rich chocolate flavor with every spoonful.",
// //   },
// //   {
// //     "title": "Cinnamon Roll",
// //     "image": "assets/images/menu/cinnamon_roll.jpg",
// //     "description":
// //         "A soft, fluffy roll swirled with cinnamon and sugar, generously topped with a sweet cream cheese frosting.",
// //   },
// //   {
// //     "title": "Egg Tart",
// //     "image": "assets/images/menu/egg_tart.webp",
// //     "description":
// //         "A small, Portuguese-inspired pastry with a flaky crust and a rich, creamy egg custard filling.",
// //   },
// //   {
// //     "title": "Ensaymada",
// //     "image": "assets/images/menu/ensaymada.jpg",
// //     "description":
// //         "A soft, Filipino brioche-like bun topped with butter, sugar, and grated cheese.",
// //   },
// //   {
// //     "title": "Japanese Milk Bread",
// //     "image": "assets/images/menu/japanese_milk_bread.jpg",
// //     "description":
// //         "Incredibly soft and fluffy bread, known for its airy texture and slightly sweet taste.",
// //   },
// //   {
// //     "title": "Lace Cookies",
// //     "image": "assets/images/menu/lace_cookies.jpg",
// //     "description":
// //         "Thin, crispy, and delicate cookies with a beautiful lacy texture, often made with oats and butter.",
// //   },
// //   {
// //     "title": "Pecan Pie",
// //     "image": "assets/images/menu/pecan_pie.jpeg",
// //     "description":
// //         "A sweet, gooey pie filling packed with pecans and baked in a buttery, flaky crust.",
// //   },
// //   {
// //     "title": "Pumpkin Crumb Cake",
// //     "image": "assets/images/menu/pumpkin_crumb_cake.jpg",
// //     "description":
// //         "A spiced pumpkin cake topped with a generous, buttery crumb topping for the perfect blend of textures.",
// //   },
// //   {
// //     "title": "Strawberry Cupcakes with Strawberry Buttercream Frosting",
// //     "image":
// //         "assets/images/menu/strawberry_cupcakes_with_strawberry_buttercream_frosting.jpg",
// //     "description":
// //         "Fluffy strawberry-flavored cupcakes topped with a light and fruity strawberry buttercream frosting.",
// //   },
// //   {
// //     "title": "Vegan Garlic Bread",
// //     "image": "assets/images/menu/vegan_garlic_bread.jpeg",
// //     "description":
// //         "Crispy bread spread with a savory, garlic-infused vegan butter, perfect as a side dish.",
// //   },
// //   {
// //     "title": "Vegan Quesitos",
// //     "image": "assets/images/menu/vegan_quesitos.jpeg",
// //     "description":
// //         "Sweet, vegan-friendly pastries from Puerto Rico, filled with creamy vegan cheese and a hint of sweetness.",
// //   },
// //   {
// //     "title": "Vegan Spinach Cheese Börek",
// //     "image": "assets/images/menu/vegan_spinach_cheese_borek.jpeg",
// //     "description":
// //         "A savory, flaky pastry filled with a delicious mix of spinach and vegan cheese, baked to a golden crisp.",
// //   },
// // ];

// class _RecommendationsState extends State<Recommendations> {
//   late List<Map<String, String>> _recommendations;

//   @override
//   void initState() {
//     super.initState();
//     _recommendations = List<Map<String, String>>.from(menuItems);
//     _recommendations.removeWhere((item) => item["title"] == widget.currentItem);
//     _recommendations.shuffle();
//     _recommendations = _recommendations.take(4).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 16),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Text(
//             "Recommendations",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: ElementColors.primary,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: 180,
//           width: double.infinity,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: _recommendations.map((rec) {
//               return _buildRecommendation(
//                 rec, // Pass the entire map
//                 MediaQuery.of(context).size.width * 0.35,
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRecommendation(Map<String, String> item, double cardWidth) {
//     return GestureDetector(
//       // <-- Wrap with GestureDetector
//       onTap: () {
//         // Navigate to the ProductPage, passing the item data
//         Navigator.push(context, CustomPageRoute(page: ProductPage(item: item)));
//       },
//       child: Container(
//         width: cardWidth,
//         margin: const EdgeInsets.only(left: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 item["image"]!,
//                 height: 120,
//                 width: cardWidth,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               item["title"]!,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 14),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/pages/products.dart';
import 'package:bakeandco/data/menu_data.dart';

class Recommendations extends StatefulWidget {
  final String currentItem;

  const Recommendations({super.key, required this.currentItem});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  late List<Map<String, dynamic>> _recommendations;

  @override
  void initState() {
    super.initState();
    // Combine all the separate lists into one for the recommendations logic
    List<Map<String, dynamic>> allItems = [
      ...classics,
      ...bread,
      ...vegan,
      ...glutenFree,
    ];

    _recommendations = List<Map<String, dynamic>>.from(allItems);
    _recommendations.removeWhere((item) => item["title"] == widget.currentItem);
    _recommendations.shuffle();
    _recommendations = _recommendations.take(4).toList();
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
            children: _recommendations.map((rec) {
              return _buildRecommendation(
                rec,
                MediaQuery.of(context).size.width * 0.35,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendation(Map<String, dynamic> item, double cardWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CustomPageRoute(page: ProductPage(item: item)));
      },
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item["image"]!,
                height: 120,
                width: cardWidth,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item["title"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
