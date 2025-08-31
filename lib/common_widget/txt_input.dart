import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class TxtInput extends StatelessWidget {
  final TextEditingController? ctrl;
  final String hintTextName;
  final TextInputType? keyboardType;
  final bool hideText;

  const TxtInput({
    super.key, 
    required this.hintTextName, 
    this.ctrl, 
    this.keyboardType, 
    this.hideText=false});

  @override 
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        child: TextField(
          autocorrect: false,
          controller: ctrl,
          keyboardType: keyboardType,
          obscureText: hideText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 5),
            hintText: hintTextName,
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
    );
  }
}


class TxtInputWithBox extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry titlePadding;
  final double titleFontSize;
  final Color? titleColor;
  final EdgeInsetsGeometry boxPadding;
  final String hintText;
  final IconData? icon; 
  final Color? bgColor;
  final double hintFontSize;
  final TextEditingController? ctrl;

  

  const TxtInputWithBox({
    super.key,
    this.title,
    this.titlePadding = const EdgeInsetsGeometry.only(right: 100),
    this.boxPadding = const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    this.titleFontSize = 18,
    this.titleColor,
    required this.hintText,
    this.icon,
    this.bgColor,
    this.hintFontSize = 14,
    this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) ...[
          Padding(
            padding: titlePadding,
            child: Text(
              title!,
              style: TextStyle(
                fontSize: titleFontSize,
                color: titleColor ?? ElementColors.primary,
              ),
            ),
          ),
        ],
        SizedBox(
          height: 60,
          child: Padding(
            padding: boxPadding,
            child: Container(
              decoration: BoxDecoration(
                color: bgColor ?? ElementColors.tertiary,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ElementColors.primary),
                  boxShadow: [
                    BoxShadow(
                      color: ElementColors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ], 
                ),
              child: TextField(
                controller: ctrl,
                style: TextStyle(fontSize: hintFontSize),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: hintFontSize, color: ElementColors.placeholder),
                  border: InputBorder.none,
                  prefixIcon: icon != null ? Icon(icon, color: ElementColors.primary) : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

