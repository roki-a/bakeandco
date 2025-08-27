import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  final bool showLeading;
  final VoidCallback? onLeadingTap;
  final String? titleText;
  final IconData? titleIcon;
  final VoidCallback? onTitleTap;
  final IconData? actionIcon;
  final VoidCallback? onActionTap;
  final double height;

  const Header({
    super.key,
    this.showLeading=false,
    this.onLeadingTap, 
    this.titleText, 
    this.titleIcon, 
    this.onTitleTap, 
    this.actionIcon, 
    this.onActionTap, 
    this.height=56});

  @override
  Widget build (BuildContext context) {
    return AppBar(
      backgroundColor: ElementColors.primary,
      toolbarHeight: height,
      elevation: 10,
      shadowColor: ElementColors.blackShadow.withOpacity(1),
      automaticallyImplyLeading: false,
      centerTitle: true,

      // leading - left side
      leading: showLeading
        ? Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded,
            color: ElementColors.tertiary,
            size: 30
            ),
            onPressed: onLeadingTap ?? () {},
          ),
        )
        : null,

      // title - center
      title: titleText != null
        ? (titleIcon != null
          // title with icon
          ? TextButton.icon(
            onPressed: onTitleTap ?? () {},
            icon: Icon(
              titleIcon,
              color: ElementColors.tertiary,
              size: 30),
              label: Text(titleText!,
              style: TextStyle(
                color: ElementColors.tertiary,
                fontSize: 18,
              ),
            ),
          )
          : Text(titleText!,
              style: TextStyle(
                color: ElementColors.tertiary,
                fontSize: 18,
              ),
            )
          )
        : null,
      
      // action - right side
      actions: actionIcon != null
        ? <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                actionIcon,
                color: ElementColors.tertiary,
                size: 30,
              ),
              onPressed: onActionTap ?? () {},
            ),
          ),
        ]
        : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}