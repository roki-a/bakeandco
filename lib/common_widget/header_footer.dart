import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class HeaderFooter extends StatefulWidget {
  const HeaderFooter({super.key});

  @override
  State<HeaderFooter> createState() => _HeaderFooterState();
}

class _HeaderFooterState extends State<HeaderFooter> {


  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ElementColors.tertiary,
        appBar: AppBar(
        backgroundColor: ElementColors.primary,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(1),
        ),
    );
  }
}