import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget implements PreferredSizeWidget {
  final String currentTab; // which tab is active

  const MenuTab({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ElementColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab(context, "Classics", "/classics"),
          _buildTab(context, "Bread", "/bread"),
          _buildTab(context, "Vegan", "/vegan"),
          _buildTab(context, "Gluten Free", "/glutenfree"),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, String route) {
    final bool isActive = currentTab == label;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
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
