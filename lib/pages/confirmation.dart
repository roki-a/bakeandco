import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/buttons.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:flutter/material.dart';

import 'my_order.dart';

class Confirmation {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ElementColors.secondary, 
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        var media = MediaQuery.of(context).size;

        return SizedBox(
          height: media.height * 0.8, 
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                // check sign image
                Image.asset(
                  "assets/icons/check.png",
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // baking icon image
                Image.asset(
                  "assets/icons/bake.png",
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // heading
                Text(
                  "Thank you for your purchase!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: ElementColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // description
                Text(
                  "Thank you for purchasing from Bake & Co! We’re delighted to let you know that your order has been successfully placed and is now being prepared with the utmost care. Your delicious treats are estimated to arrive soon. We truly appreciate your trust in Bake & Co and can’t wait for you to enjoy your freshly baked goodies!",
                  style: TextStyle(
                    fontSize: 14,
                    color: ElementColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 28),

                // check my order button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Buttons(
                      title: "Check My Order",
                      onClick: () {
                        Navigator.push(context, CustomPageRoute(page: MyOrder()));
                      },
                      height: 45,
                      fontSize: 18,
                    ),
                  ),
                
                const SizedBox(height: 14),

                // back To home button
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Buttons(
                      title: "Back To Home",
                      type: BtnType.txtPrimary,
                      onClick: () {
                        Navigator.push(context, CustomPageRoute(page: HomeDashboard()));
                      },
                      height: 45,
                      fontSize: 18,
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
