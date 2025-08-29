import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/pages/bread_menu.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/gluten_free_menu.dart';
import 'package:bakeandco/pages/vegan_menu.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget implements PreferredSizeWidget {
  final int currentTab; // which tab is active

  const MenuTab({super.key, required this.currentTab});

  void onChosenTab(BuildContext context, int index) {
    if (index == currentTab) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ClassicsMenu()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BreadMenu()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const VeganMenu()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const GlutenFreeMenu()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ElementColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab(context, "Classics", 0),
          _buildTab(context, "Bread", 1),
          _buildTab(context, "Vegan", 2),
          _buildTab(context, "Gluten Free", 3),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, int index) {
    final bool isActive = currentTab == index;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onChosenTab(context, index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive
              ? ElementColors.tertiary
              : const Color.fromARGB(0, 255, 0, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decorationColor: ElementColors.primary,
            color: isActive ? ElementColors.primary : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
