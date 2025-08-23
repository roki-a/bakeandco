import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/regis_btn.dart';
import 'package:bakeandco/pages/home.dart';
import 'package:bakeandco/pages/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ElementColors.bgColor,
        appBar: AppBar(
        backgroundColor: ElementColors.primary,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(1),
        ),
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
                  // sign up text
                  const SizedBox(height: 200),
                  Text("Sign Up",
                    style: TextStyle(
                      color: ElementColors.primary,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  // email textfield
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        autocorrect: false,
                        controller: email,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          hintText: "E-mail",
                          hintStyle: TextStyle(
                            color: ElementColors.placeholder, 
                            fontSize: 20,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ElementColors.primary,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ElementColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                   // name textfield
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        autocorrect: false,
                        controller: name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: ElementColors.placeholder, 
                            fontSize: 20,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ElementColors.primary,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ElementColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                   // password textfield
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        autocorrect: false,
                        controller: password,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: ElementColors.placeholder, 
                            fontSize: 20,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ElementColors.primary,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ElementColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // sign up button
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: RegisBtn(
                      title: "Sign Up",
                      type: BtnType.txtPrimary,
                      onClick: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeDashboard()));
                      },
                    ),
                  ),

                  // text 
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 13,
                          color: ElementColors.primary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                        child: Text(
                          "Log in",
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