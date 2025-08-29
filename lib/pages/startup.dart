import 'package:bakeandco/common_style/color_extension.dart';
import 'package:bakeandco/common_widget/custom_page_route.dart';
import 'package:bakeandco/common_widget/header.dart';
import 'package:bakeandco/pages/registration.dart';
import 'package:flutter/material.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    super.initState();
    goRegistrationPage();
  }

  void goRegistrationPage() async {
    await Future.delayed(const Duration(seconds: 3));
    registrationPage();
  }

  void registrationPage() {
    Navigator.push(context, CustomPageRoute(page: Registration()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: ElementColors.tertiary,
      appBar: const Header(),
      
      body: Stack(
        // background image
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/bg_image.png",
          width: media.width,
          height: media.height * .8,
          fit: BoxFit.cover,
          ),
          
          // logo image - Bake&Co 
          Positioned(
            top: 120,
            child: Image.asset("assets/images/name_logo.png",
            width: media.width * .73,
            ),
          ),

        // cookie image
          Image.asset("assets/images/cookie_logo.png",
            width: media.width * .73)
        ],
      )
    );
  }
}