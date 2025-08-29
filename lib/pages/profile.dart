import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/buttons.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/edit_address_payment.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/login.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:bakeandco/pages/my_orders.dart';
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
        showLeading: true,
        onLeadingTap: () {
          Navigator.push(context, CustomPageRoute(page: HomeDashboard()));
        },
        titleText: "My Profile",
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {
          Navigator.push(context, CustomPageRoute(page: MyCart()));
        },
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
                CustomBox(
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
                CustomBox(
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

                // Reviews box
                CustomBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              Navigator.push(context, CustomPageRoute(page: Reviews()));
                            },
                            child: Text("View all",
                                style: TextStyle(
                                  color: ElementColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ElementColors.primary,)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildReviewItem("Product Name", 5),
                      _buildReviewItem("Product Name", 4),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ===== LOGOUT BUTTON =====
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: RegisBtn(
                      title: "Logout",
                      icon: Icons.logout,
                      onClick: () {
                        Navigator.push(context, CustomPageRoute(page: Login()));
                      },
                      type: BtnType.bgPrimary,
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
  return InkWell(
    onTap: () {
      if (text == "Payment Method" || text == "Change Address") {
        Navigator.push(context, CustomPageRoute(page: EditAddressPayment()));
      } else if (text == "My Order") {
        Navigator.push(context, CustomPageRoute(page: MyOrders()));
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
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
      ),
    ),
  );
}


  Widget _buildReviewItem(String product, int stars) {
  return CustomBox(
    color: ElementColors.tertiary,
    hasBorder: false,
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
          color: ElementColors.primary,
        ),
        const SizedBox(height: 8),
        Container(
          height: 10, // empty lines for review text
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: ElementColors.primary, width: 1),
              bottom: BorderSide(color: ElementColors.primary, width: 1),
            ),
          ),
        ),
      ],
    ),
  );
  }}