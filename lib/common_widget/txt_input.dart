import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class TxtInput extends StatelessWidget {
  final TextEditingController? ctrl;
  final String hintTextName;
  final TextInputType? keyboardType;
  final bool hideText;

  const TxtInput({super.key, required this.hintTextName, this.ctrl, this.keyboardType, this.hideText=false});

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