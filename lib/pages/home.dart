// import 'package:bakeandco/common_style/color_extension.dart';
// import 'package:bakeandco/common_widget/main_bg.dart';
// import 'package:flutter/material.dart';

// class HomeDashboard extends StatefulWidget {
//   const HomeDashboard({super.key});

//   @override
//   State<HomeDashboard> createState() => _HomeDashboardState();
// }

// class _HomeDashboardState extends State<HomeDashboard> {


//   @override
//   Widget build(BuildContext context) {
//     // var media = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: ElementColors.tertiary,
//         appBar: AppBar(
//         backgroundColor: ElementColors.primary,
//         toolbarHeight: 100,
//         elevation: 10,
//         shadowColor: Colors.black.withOpacity(1),
//         automaticallyImplyLeading: false,
//         title: TextButton.icon(
//           onPressed: () {  },
//           icon: Icon(Icons.location_on_outlined, 
//             color: ElementColors.tertiary, 
//             size: 30.0
//           ), 
//           label: Text("Your Location", 
//             style: TextStyle(
//             color: ElementColors.tertiary,
//             fontSize: 18,
//             ),
//           ),
//         ), 
//         centerTitle: true,
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: IconButton(
//               icon: Icon(Icons.shopping_cart, 
//                 color: ElementColors.tertiary, 
//                 size: 30.0,
//                 ), 
//               onPressed: () {  },
//             ),
//           ),
//         ],
//       ),

//       body: Stack(
//         children: [
//           const MainBg(child: SizedBox()),

//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 40),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 100),
//                     child: Text("What are you craving today?",
//                       style: TextStyle(
//                         color: ElementColors.primary,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
                  
//                 // search bar
//                 SizedBox(
//                   height: 60,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: ElementColors.secondary,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(color: ElementColors.primary),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 6,
//                             offset: const Offset(2, 4),
//                           ),
//                         ],
//                       ),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: ElementColors.primary,
//                           ),
//                           hintText: "Search for your favorite dessert!",
//                           hintStyle: TextStyle(
//                             color: ElementColors.placeholder,
//                             fontSize: 14,
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(vertical: 12),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),


//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/category_card.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: AppBar(
        backgroundColor: ElementColors.primary,
        toolbarHeight: 100,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(1),
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.location_on_outlined,
              color: ElementColors.tertiary, size: 30.0),
          label: Text(
            "Your Location",
            style: TextStyle(
              color: ElementColors.tertiary,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: ElementColors.tertiary,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const MainBg(child: SizedBox()),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    "What are you craving today?",
                    style: TextStyle(
                      color: ElementColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ),

                // search bar
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ElementColors.secondary,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ElementColors.primary),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: ElementColors.primary,
                          ),
                          hintText: "Search for your favorite dessert!",
                          hintStyle: TextStyle(
                            color: ElementColors.placeholder,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
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
    );
  }
}
