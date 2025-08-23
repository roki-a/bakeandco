import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

enum BtnType { bgPrimary, txtPrimary }

class RegisBtn extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final BtnType type;
  const RegisBtn({super.key, required this.title, required this.onClick, this.type=BtnType.bgPrimary});

  @override
  Widget build (BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == BtnType.bgPrimary ? null : Border.all(color: ElementColors.primary, width: 1),
          color: type == BtnType.bgPrimary ? ElementColors.primary : ElementColors.secondary, 
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: type == BtnType.bgPrimary ? ElementColors.tertiary : ElementColors.primary,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}