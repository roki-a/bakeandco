// import 'package:bakeandco/common_style/color_extension.dart';
// import 'package:bakeandco/common_widget/footer.dart';
// import 'package:bakeandco/common_widget/header.dart';
// import 'package:bakeandco/common_widget/main_bg.dart';
// import 'package:bakeandco/pages/home.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
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
//         titleText: "My Profile",
//         actionIcon: Icons.shopping_cart_rounded,
//       ),
      
//       body: Stack(
//         children: [
//           const MainBg(child: SizedBox()),
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 // profile
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: ElementColors.secondary,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: ElementColors.primary),
//                     boxShadow: [
//                       BoxShadow(
//                       color: ElementColors.blackShadow.withOpacity(0.1),
//                       blurRadius: 6,
//                       offset: const Offset(2, 2)
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 37,
//                         backgroundColor: ElementColors.primary,
//                         child: CircleAvatar(
//                           radius: 35,
//                           backgroundColor: ElementColors.tertiary,
//                           child: Icon(
//                             Icons.person,
//                             size: 60,
//                             color: ElementColors.primary),
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Name: __________",)]
//                         )
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           )
//         ],
//       ),
//       bottomNavigationBar: const Footer(currentIndex: 3),
//     );
//   }
// }

import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/category_card.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/login.dart';
import 'package:bakeandco/pages/recently_viewed.dart';
import 'package:bakeandco/pages/reviews.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        height: 100,
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeDashboard()));
        },
        titleText: "My Profile",
        actionIcon: Icons.shopping_cart_rounded,
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile info box
                ProfileBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 37,
                            backgroundColor: ElementColors.primary,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: ElementColors.tertiary,
                              child: Icon(Icons.person,
                                  size: 60, color: ElementColors.primary),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow("Name:"),
                                _buildInfoRow("Address:"),
                                _buildInfoRow("Contact Number:"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Payment/Address/Orders box
                ProfileBox(
                  child: Column(
                    children: [
                      _buildMenuRow(Icons.payment, "Payment Method"),
                      Divider(color: ElementColors.primary.withOpacity(0.3)),
                      _buildMenuRow(Icons.location_on, "Change Address"),
                      Divider(color: ElementColors.primary.withOpacity(0.3)),
                      _buildMenuRow(Icons.shopping_bag, "My Order"),
                    ],
                  ),
                ),

                // Recently Viewed + Reviews box
                ProfileBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recently Viewed
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Viewed",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ElementColors.primary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const RecentlyViewed()));
                            },
                            child: Text("View all",
                                style: TextStyle(
                                  color: ElementColors.primary,
                                  decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildRecentItem("Cinnamon Roll",
                              "assets/images/menu/cinnamon_roll.jpg"),
                          _buildRecentItem("Ensaymada",
                              "assets/images/menu/ensaymada.jpg"),
                          _buildRecentItem("Chocolate Souffle",
                              "assets/images/menu/chocolate_souffle.jpg"),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Reviews
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ElementColors.primary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Reviews()));
                            },
                            child: Text("View all",
                                style: TextStyle(
                                  color: ElementColors.primary,
                                  decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildReviewItem("Product Name", 5),
                      _buildReviewItem("Product Name", 4),
                    ],
                  ),
                ),

                const SizedBox(height: .1),

                // ===== LOGOUT BUTTON =====
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ElementColors.primary,
                      foregroundColor: ElementColors.tertiary,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                    icon: const Icon(Icons.logout, size: 18),
                    label: const Text(
                      "Logout",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(currentIndex: 3),
    );
  }

  Widget _buildInfoRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        label,
        style: TextStyle(
          color: ElementColors.primary,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildMenuRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: ElementColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: ElementColors.primary, fontSize: 14),
          ),
        ),
        Icon(Icons.chevron_right, color: ElementColors.primary),
      ],
    );
  }

  Widget _buildRecentItem(String title, String imagePath) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: ElementColors.primary),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String product, int stars) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: ElementColors.tertiary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ElementColors.primary.withOpacity(0.4)),
      boxShadow: [
        BoxShadow(
          color: ElementColors.blackShadow.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(2, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ElementColors.primary,
              ),
            ),
            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  i < stars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(
          thickness: 1,
          color: ElementColors.primary, // matches your UI style
        ),
        const SizedBox(height: 8),
        Container(
          height: 10, // empty lines for review text
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.brown, width: 1),
              bottom: BorderSide(color: Colors.brown, width: 1),
            ),
          ),
        ),
      ],
    ),
  );
  }}