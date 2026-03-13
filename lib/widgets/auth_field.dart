import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller ; 
  final String placeholderText;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String imagePath;

  const AuthField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.placeholderText,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onTap,
      required this.controller  , 
    this.imagePath = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(70),
        border: Border.all(color: Color(0xff737373).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 34.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                shape: BoxShape.circle,
              ),
              child: Image.asset(imagePath, height: 18.sp, width: 18.sp),
            ),
          ),

          Container(width: 1, height: 22, color: const Color(0xFFDDDDDD)),

          Expanded(
            child: TextFormField(
              readOnly: readOnly,
              controller: controller ,
              onTap: onTap,
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
              decoration: InputDecoration(
                labelText: hintText,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFAAAAAA),
                ),
                hintText: placeholderText,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFCCCCCC),
                ),
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 20.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
