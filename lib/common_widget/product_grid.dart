import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/pages/products.dart';
import 'package:flutter/material.dart';

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

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.all(2),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, // responsive width per card
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          itemCount: displayCount,
          itemBuilder: (context, index) {
            final item = products[index];
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: ElementColors.primary, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: ElementColors.blackShadow.withOpacity(0.1),
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
