import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/buttons.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/pages/login.dart';
import 'package:bakeandco/pages/signup.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: const Header(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // background image
          Positioned(
            top: -media.height * 0.28,
            child: Image.asset(
              "assets/images/bg_image.png",
              width: media.width,
              height: media.height * .8,
              fit: BoxFit.fill,
            ),
          ),

          // logo image
          Positioned(
            top: media.height * 0.09,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 120, maxWidth: 380),
              child: Image.asset(
                "assets/images/name_logo.png",
                width: media.width * .7,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // cookie image
          Positioned(
            top: media.height * 0.16,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 130, maxWidth: 300),
              child: Image.asset(
                "assets/images/cookie_logo.png",
                width: media.width * .7,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // log in button
          Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 100,
                ), // distance from bottom
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // log in button
                    Buttons(
                      title: "Log In",
                      onClick: () {
                        Navigator.push(context, CustomPageRoute(page: Login()));
                      },
                    ),
                    const SizedBox(height: 20),

                    // divider "or"
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            endIndent: 10,
                            color: ElementColors.primary,
                          ),
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                            fontSize: 16,
                            color: ElementColors.primary,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            indent: 10,
                            color: ElementColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // sign up button
                    Buttons(
                      title: "Sign Up",
                      type: BtnType.txtPrimary,
                      onClick: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(page: Signup()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
