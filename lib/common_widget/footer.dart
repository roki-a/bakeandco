import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/favorites.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/profile.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int currentIndex;

  const Footer({
    super.key,
    required this.currentIndex,
  });

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
      selectedItemColor: ElementColors.tertiary,
      unselectedItemColor: ElementColors.tertiary,

      // styling for selected item
      selectedIconTheme: IconThemeData(
        color: ElementColors.primary,
        size: 28,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 28,
      ),

      items: [
        _buildNavItem(Icons.home, 'Home', 0),
        _buildNavItem(Icons.restaurant_menu, 'Menu', 1),
        _buildNavItem(Icons.favorite, 'Favorites', 2),
        _buildNavItem(Icons.person, 'Profile', 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: currentIndex == index ? ElementColors.tertiary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}

