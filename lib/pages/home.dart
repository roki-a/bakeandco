import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/txt_input.dart';
import 'package:bakeandco/pages/bread_menu.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/edit_address_payment.dart';
import 'package:bakeandco/pages/gluten_free_menu.dart';
import 'package:bakeandco/pages/my_cart.dart';
import 'package:bakeandco/pages/vegan_menu.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: Header(
        titleText: "Your Location",
        titleIcon: Icons.location_on_outlined,
        onTitleTap: () {
          Navigator.push(context, CustomPageRoute(page: EditAddressPayment()));
        },
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {
          Navigator.push(context, CustomPageRoute(page: MyCart()));
        },
      ),

      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TxtInputWithBox(
                  title: "What are you craving today?",
                  icon: Icons.search,
                  hintText: "Search for your favorite dessert!",
                  bgColor: ElementColors.secondary,
                  hintFontSize: 14,
                  ctrl: search,
                ),

                // category cards
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      CategoryCard(
                        image: "assets/images/menu/cinnamon_roll.jpg",
                        title: "Classics",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, CustomPageRoute(page: const ClassicsMenu()));
                        },
                      ),
                      CategoryCard(
                        image: "assets/images/menu/ensaymada.jpg",
                        title: "Bread",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, CustomPageRoute(page: BreadMenu()));
                        },
                      ),
                      CategoryCard(
                        image: "assets/images/menu/vegan_garlic_bread.jpeg",
                        title: "Vegan",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, CustomPageRoute(page: const VeganMenu()));
                        },
                      ),
                      CategoryCard( 
                        image: "assets/images/menu/chocolate_souffle.jpg",
                        title: "Gluten Free",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, CustomPageRoute(page: const GlutenFreeMenu()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: const Footer(currentIndex: 0),
    );
  }
}
