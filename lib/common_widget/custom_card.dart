import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final VoidCallback onClick;
  final String image;
  final String title;
  final String description;

  const CategoryCard({
    super.key,
    required this.onClick,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: ElementColors.secondary,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ElementColors.primary),
          boxShadow: [
            BoxShadow(
              color: ElementColors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: ElementColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        color: ElementColors.primary,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool hasBorder;

  const CustomBox({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.symmetric(vertical: 6),
    this.padding = const EdgeInsets.all(12),
    this.color, 
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? ElementColors.secondary,
        border: hasBorder
          ? Border.all(color: ElementColors.primary)
          : null,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ElementColors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
