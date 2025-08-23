import 'package:flutter/material.dart';

class MainBg extends StatelessWidget {
  final Widget child; // so you can pass content inside the background

  const MainBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Background circles
        Positioned(
          top: -350,
          right: 200,
          child: Image.asset("assets/images/circle_background.png",
            width: media.width,
            height: media.height * .8,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: -10,
          left: 220,
          child: Image.asset("assets/images/circle_background.png",
            width: media.width,
            height: media.height * .8,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: -320,
          right: 180,
          child: Image.asset("assets/images/circle_background.png",
            width: media.width * .8,
            height: media.height * .8,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: -400,
          right: 70,
          child: Image.asset("assets/images/circle_background.png",
            width: media.width * .8,
            height: media.height * .8,
            fit: BoxFit.contain,
          ),
        ),
        Positioned.fill( 
            child: child,
          ),
      ],
    );
  }
}