import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/buttons.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/common_widget/txt_input.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ElementColors.tertiary,
        appBar: const Header(),
        
      body: Stack(
        alignment: Alignment.center,
        children: [
          // background image at the top
          Positioned(
            top: -440,
            child: Image.asset("assets/images/bg_2.png",
              width: media.width * 1.05,
              height: media.height,
              fit: BoxFit.contain,
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // log in text
                  const SizedBox(height: 200),
                  Text("Log In",
                    style: TextStyle(
                      color: ElementColors.primary,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                   // email textfield
                  const SizedBox(height: 50),
                  TxtInput(
                    ctrl: email, 
                    hintTextName: "E-mail", 
                    keyboardType: TextInputType.emailAddress,
                  ),

                  // password textfield
                  const SizedBox(height: 50),
                  TxtInput(
                    ctrl: password, 
                    hintTextName: "Password", 
                    hideText: true,
                  ),

                  // log in button
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: RegisBtn(
                      title: "Log In",
                      onClick: () {
                        Navigator.push(context, CustomPageRoute(page: const HomeDashboard()));
                      },
                    ),
                  ),

                  // text 
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 13,
                          color: ElementColors.primary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, CustomPageRoute(page: Signup()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: ElementColors.primary, // same theme color as button
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}