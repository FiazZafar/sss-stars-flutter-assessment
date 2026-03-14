import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';

class AuthField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final String placeholderText;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String imagePath;
  final String? Function(String?)? validator;
  final bool isValid;
  final void Function(String)? onChanged;

  const AuthField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.placeholderText,
    required this.onChanged,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onTap,
    required this.controller,
    this.imagePath = '',
    this.validator,
    this.isValid = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = isValid
        ? AppColors.primary
        : const Color(0xFFAAAAAA);

    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
        border: Border.all(
          color: isValid
              ? AppColors.primary
              : const Color(0xff737373).withOpacity(0.2),
          width: isValid ? 1.5 : 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 20.w,
              height: 20.h,
              
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
                child: Image.asset(imagePath, height: 18.sp, width: 18.sp),
              ),
            ),
          ),
          Container(
            width: 1,
            height: 22,
            color: isValid
                ? AppColors.primary.withOpacity(0.4)
                : const Color(0xFFDDDDDD),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              readOnly: readOnly,
              controller: controller,
              onTap: onTap,
              obscureText: obscureText,
              keyboardType: keyboardType,
              validator: validator,
              style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
              decoration: InputDecoration(
                labelText: hintText,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w500,
                  color: isValid
                      ? AppColors.primary
                      : const Color(0xFFAAAAAA),
                ),
                hintText: placeholderText,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFCCCCCC),
                ),
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                errorStyle: const TextStyle(
                  height: 0,
                  fontSize: 0,
                ), // ✅ hide error text
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
