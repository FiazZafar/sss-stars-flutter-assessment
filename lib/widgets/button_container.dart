import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';

class SSSStoreBtn extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? padding;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final Widget? image;
  final Color? bgColor;
  final Color? borderColor;
  final GlobalKey? textKey;
  final bool showShadow;
  final bool showGradient;
  final double? borderWid;
  final bool enableBorder;
  final Gradient? gradient;
  final bool isEnabled; // ✅ new param

  const SSSStoreBtn({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
    this.textStyle,
    this.prefixIcon,
    this.sufixIcon,
    this.bgColor,
    this.borderColor,
    this.textKey,
    this.borderWid,
    this.image,
    this.showShadow = false,
    this.enableBorder = false,
    this.showGradient = true,
    this.gradient,
    this.isEnabled = false,
  });

  static const Gradient _disabledGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.centerRight,
    colors: [Color(0xFFCCCCCC), Color(0xFF999999)],
  );

  static const Gradient _enabledGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.centerRight,
    colors: [Color(0xFF4A90D9), Color(0xFF1A5FA8)],
  );

  @override
  Widget build(BuildContext context) {
    final Gradient activeGradient = gradient ??
        (isEnabled ? _enabledGradient : _disabledGradient);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 20.0.w),
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null, 
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300), 
          height: height ?? 75.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            gradient: showGradient ? activeGradient : null,
            color: showGradient ? null : bgColor ?? AppColors.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 60.sp),
            border: enableBorder
                ? Border.all(
                    color: borderColor ?? AppColors.primary,
                    width: borderWid ?? 1,
                  )
                : null,
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(1, 4),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefixIcon != null) prefixIcon!,
              if (prefixIcon != null) SizedBox(width: 0.w),
              if (image != null) image!,
              if (image != null) SizedBox(width: 6.w),
              Text(
                title,
                key: textKey,
                style: textStyle ??
                    GoogleFonts.poppins(
                      color: isEnabled ? AppColors.white : AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
              ),
              if (sufixIcon != null) sufixIcon!,
              if (sufixIcon != null) SizedBox(width: 6.w),
            ],
          ),
        ),
      ),
    )
    .animate()
    .shake(duration: 300.ms)
    .then(delay: 100.ms)
    .shimmer(duration: 600.ms, color: AppColors.primary.withOpacity(0.2));
  }
}