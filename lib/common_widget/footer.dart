import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/favorites.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/profile.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int currentIndex;

  const Footer({super.key, required this.currentIndex});

  void onChosenPage(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeDashboard()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ClassicsMenu()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Favorites()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onChosenPage(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: ElementColors.primary,
      selectedItemColor: ElementColors.primary,
      unselectedItemColor: ElementColors.tertiary,
      selectedFontSize: 10, // shrink text
      unselectedFontSize: 10,
      iconSize: 22, // shrink icon
      // disable default labels (since we handle them manually)
      showSelectedLabels: false,
      showUnselectedLabels: false,

      items: [
        _buildNavItem(Icons.home, 'Home', 0),
        _buildNavItem(Icons.restaurant_menu, 'Menu', 1),
        _buildNavItem(Icons.favorite, 'Favorites', 2),
        _buildNavItem(Icons.person, 'Profile', 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    final isActive = currentIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: isActive
            ? BoxDecoration(
                color: ElementColors.tertiary,
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? ElementColors.primary : ElementColors.tertiary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? ElementColors.primary
                    : ElementColors.tertiary,
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      label: "", // handled manually inside container
    );
  }
}
