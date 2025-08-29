// import 'package:bakeandco/common_style/color_extension.dart';
// import 'package:flutter/material.dart';

// enum BtnType { bgPrimary, txtPrimary }

// class RegisBtn extends StatelessWidget {
//   final VoidCallback onClick;
//   final String title;
//   final BtnType type;
  
//   const RegisBtn({
//     super.key, 
//     required this.title, 
//     required this.onClick, 
//     this.type = BtnType.bgPrimary,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 60,
//       child: ElevatedButton(
//         onPressed: onClick,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: type == BtnType.bgPrimary 
//               ? ElementColors.primary 
//               : ElementColors.secondary,
//           foregroundColor: type == BtnType.bgPrimary 
//               ? ElementColors.tertiary 
//               : ElementColors.primary,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//             side: type == BtnType.bgPrimary
//                 ? BorderSide.none
//                 : BorderSide(color: ElementColors.primary, width: 1),
//           ),
//           textStyle: const TextStyle(
//             fontSize: 22,
//           ),
//         ),
//         child: Text(title),
//       ),
//     );
//   }
// }

import 'package:bakeandco/common_style/color_extension.dart';
import 'package:flutter/material.dart';

enum BtnType { bgPrimary, txtPrimary }

class RegisBtn extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final BtnType type;
  final IconData? icon;

  const RegisBtn({
    super.key,
    required this.title,
    required this.onClick,
    this.type = BtnType.bgPrimary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: type == BtnType.bgPrimary ? ElementColors.primary : ElementColors.secondary,
        foregroundColor: type == BtnType.bgPrimary ? ElementColors.tertiary : ElementColors.primary,
        minimumSize: const Size.fromHeight(60), // full height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: type == BtnType.bgPrimary
              ? BorderSide.none
              : BorderSide(color: ElementColors.primary, width: 1),
        ),
      ),
      onPressed: onClick,
      icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
      label: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

