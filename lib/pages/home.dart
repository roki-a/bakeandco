import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_card.dart';
import 'package:bakeandco/common_widget/footer.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/common_widget/txt_input.dart';
import 'package:bakeandco/pages/bread_menu.dart';
import 'package:bakeandco/pages/classics_menu.dart';
import 'package:bakeandco/pages/gluten_free_menu.dart';
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
        height: 100,
        titleText: "Your Location",
        titleIcon: Icons.location_on_outlined,
        onTitleTap: () {
          
        },
        actionIcon: Icons.shopping_cart_rounded,
        onActionTap: () {
          
        },
      ),

      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ClassicsMenu()));
                        },
                      ),
                      CategoryCard(
                        image: "assets/images/menu/ensaymada.jpg",
                        title: "Bread",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BreadMenu()));
                        },
                      ),
                      CategoryCard(
                        image: "assets/images/menu/vegan_garlic_bread.jpeg",
                        title: "Vegan",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VeganMenu()));
                        },
                      ),
                      CategoryCard( 
                        image: "assets/images/menu/chocolate_souffle.jpg",
                        title: "Gluten Free",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const GlutenFreeMenu()));
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
