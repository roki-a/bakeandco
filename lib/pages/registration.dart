import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/regis_btn.dart';
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
      appBar: AppBar(
        backgroundColor: ElementColors.primary,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(1),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // background image
          Positioned(
            top: -220,
            child: Image.asset("assets/images/bg_image.png",
              width: media.width,
              height: media.height * .8,
              fit: BoxFit.contain,
            ),
          ),

          // logo image
          Positioned(
            top: 70,
            child: Image.asset("assets/images/name_logo.png",
              width: media.width * .7,
              fit: BoxFit.contain,
            ),
          ),

          // cookie image
          Positioned(
            top: 130,
            child: Image.asset("assets/images/cookie_logo.png",
              width: media.width * .7,
              fit: BoxFit.contain,
            ),
          ),

          // log in button
          Positioned(
            bottom: 230,
            left: 50,
            right: 50,
            child: RegisBtn(
              title: "Log In",
              onClick: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ),

          // divider - or
          Positioned(
            bottom: 190,
            left: 50,
            right: 50,
            child: Row(
              children: [
                Expanded(
                  child: Divider(thickness: 1, endIndent: 10, color: ElementColors.primary),
                ),
                Text("or",
                  style: TextStyle(
                    fontSize: 16,
                    color: ElementColors.primary,
                  ),
                ),
                Expanded(
                  child: Divider(thickness: 1, indent: 10, color: ElementColors.primary),
                ),
              ],
            ),
          ),

          // sign up button
          Positioned(
            bottom: 110,
            left: 50,
            right: 50,
            child: RegisBtn(
              title: "Sign Up",
              type: BtnType.txtPrimary,
              onClick: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
