import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'favorites.dart';
import 'profile.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _selectedIndex = 0;

  // Keep menuItems here so Menu + Favorites share the same data
  List<Map<String, dynamic>> menuItems = [
    {"title": "Chocolate Soufflé", "image": "https://picsum.photos/id/1080/400/400", "favorite": true},
    {"title": "Flourless Chocolate Cake", "image": "https://picsum.photos/id/1081/400/400", "favorite": false},
    {"title": "Chocolate Chip Baked Oatmeal Cups", "image": "https://picsum.photos/id/1082/400/400", "favorite": false},
    {"title": "Chocolate Soufflé", "image": "https://picsum.photos/id/1083/400/400", "favorite": false},
    {"title": "Bowl Baked Oatmeal", "image": "https://picsum.photos/id/1084/400/400", "favorite": false},
    {"title": "Pumpkin Coffee Cake", "image": "https://picsum.photos/id/1085/400/400", "favorite": true},
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      const Center(child: Text("Home Page")),
      MenuPage(menuItems: menuItems),
      FavoritesPage(menuItems: menuItems),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}