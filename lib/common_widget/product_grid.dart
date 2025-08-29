import 'package:flutter/material.dart';
import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/pages/products.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int? itemLimit;

  const ProductGrid({
    super.key,
    required this.products,
    this.itemLimit,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = itemLimit == null
        ? products.length
        : (itemLimit! < products.length ? itemLimit! : products.length);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: displayCount,
      itemBuilder: (context, index) {
        final item = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(item: item),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item["image"],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item["title"],
                style: const TextStyle(
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
  }
}
