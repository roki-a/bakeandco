import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/main_bg.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';

class VeganMenu extends StatefulWidget {
  const VeganMenu({super.key});

  @override
  State<VeganMenu> createState() => _VeganMenuState();
}

class _VeganMenuState extends State<VeganMenu> {
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
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ElementColors.tertiary,
              size: 30.0
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeDashboard()));
            },
          ),
        ),
        title: Text(
            "Our Menu",
            style: TextStyle(
              color: ElementColors.tertiary,
              fontSize: 18,
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
        ],
      ),
    );
  }
}