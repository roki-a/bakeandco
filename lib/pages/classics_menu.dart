// import 'package:bakeandco/common_style/color_extension.dart';
// import 'package:bakeandco/common_widget/footer.dart';
// import 'package:bakeandco/common_widget/header.dart';
// import 'package:bakeandco/common_widget/main_bg.dart';
// import 'package:bakeandco/pages/home.dart';
// import 'package:flutter/material.dart';

// class ClassicsMenu extends StatefulWidget {
//   const ClassicsMenu({super.key});

//   @override
//   State<ClassicsMenu> createState() => _ClassicsMenuState();
// }

// class _ClassicsMenuState extends State<ClassicsMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ElementColors.tertiary,
//       appBar: Header(
//         height: 100,
//         showLeading: true,
//         onLeadingTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeDashboard()));
//         },
//         titleText: "Our Menu",
//         actionIcon: Icons.shopping_cart_rounded,
//       ),

//       body: Stack(
//         children: [
//           const MainBg(child: SizedBox()),
//         ],
//       ),
//       bottomNavigationBar: const Footer(currentIndex: 1),
//     );
//   }
// }

// ADET TIME EDITTED
// import 'package:bakeandco/common_style/color_extension.dart';
// import 'package:bakeandco/common_widget/footer.dart';
// import 'package:bakeandco/common_widget/header.dart';
// import 'package:bakeandco/common_widget/main_bg.dart';
// import 'package:bakeandco/common_widget/menu_tab.dart'; // import your menu tab
// import 'package:bakeandco/pages/home.dart';
// import 'package:flutter/material.dart';

// class ClassicsMenu extends StatelessWidget {
//   const ClassicsMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ElementColors.tertiary,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(157), // Header + Tabs
//         child: Column(
//           children: [
//             Header(
//               height: 100,
//               showLeading: true,
//               titleText: "Our Menu",
//               actionIcon: Icons.shopping_cart_rounded,
//               onLeadingTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const HomeDashboard(),
//                   ),
//                 );
//               },
//             ),
//             const MenuTab(currentTab: "Classics"),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           const MainBg(child: SizedBox()),
//           Center(
//             child: Text(
//               "Classics Menu Content Here",
//               style: TextStyle(fontSize: 18, color: ElementColors.primary),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: const Footer(currentIndex: 1),
//     );
//   }
// }

// TRY for products
import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/menu_tab.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';
import 'product_classics.dart';

class ClassicsMenu extends StatelessWidget {
  const ClassicsMenu({super.key});

  // Sample classics items (replace with your data)
  final List<Map<String, dynamic>> classics = const [
    {
      "title": "Cinnamon Roll",
      "image": "assets/images/menu/cinnamon_roll.jpg",
      "price": 150,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
    {
      "title": "Chocolate Soufflé",
      "image": "assets/images/menu/chocolate_souffle.jpg",
      "price": 150,
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(157), // Header + Tabs
        child: Column(
          children: [
            Header(
              height: 100,
              showLeading: true,
              titleText: "Our Menu",
              actionIcon: Icons.shopping_cart_rounded,
              onLeadingTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeDashboard(),
                  ),
                );
              },
            ),
            const MenuTab(currentTab: "Classics"),
          ],
        ),
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: classics.length,
              itemBuilder: (context, index) {
                final item = classics[index];
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
                          child: Image.network(
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 1),
    );
  }
}
