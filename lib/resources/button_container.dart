// import 'package:flutter/material.dart';
// import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';

// class ButtonContainer {
//   final Widget child;
//   final VoidCallback function;
//   final double height;
//   final double width;
//   final Color color;

//   const ButtonContainer({
//     required this.function,
//     required this.child,
//     this.color = AppColors.borderGrey,
//     this.height = 54,
//     this.width = 50,
//   });

//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: function,
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(width, height),
//         backgroundColor: color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//           side: BorderSide(color: AppColors.transparent, width: 0.1),
//         ),
//       ),
//       child: child,
//     );
//   }
// }
