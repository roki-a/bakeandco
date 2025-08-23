import 'package:bakeandco/common_style/color_extension.dart';
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration()));
  }

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
            child: Image.asset("assets/images/logo.png",
            width: media.width * .73,
            ),
          ),

        // cookie image
          Image.asset("assets/images/cookie.png",
            width: media.width * .73)
        ],
      )
    );
  }
}