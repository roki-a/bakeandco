// import 'package:flutter/material.dart';

// class StartLayout extends StatelessWidget {
//   final Widget? child; // extra content (like Welcome + buttons)
//   final bool showCourse; // true for Startup, false for Registration

//   const StartLayout
// ({super.key, this.child, this.showCourse = false});

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               // background
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Image.asset(
//                   "assets/images/bg_image.png",
//                   width: media.width,
//                   fit: BoxFit.cover,
//                 ),
//               ),

//               // logo
//               Positioned(
//                 top: 60,
//                 child: Image.asset(
//                   "assets/images/logo.png",
//                   width: media.width * 0.7,
//                 ),
//               ),

//               // cookie
//               Positioned(
//                 top: 170,
//                 child: Image.asset(
//                   "assets/images/cookie.png",
//                   width: media.width * 0.65,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         if (child != null) child!,
//       ],
//     );
//   }
// }
