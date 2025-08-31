import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/data/menu_data.dart';
import 'package:bakeandco/pages/products.dart';
import 'package:flutter/material.dart';

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
