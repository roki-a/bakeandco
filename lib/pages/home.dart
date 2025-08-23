import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {


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
    );
  }
}