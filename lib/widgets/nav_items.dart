import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? const Color(0xFF4A90D9)
        : const Color(0xffC1CEDC);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child:
          SizedBox(
                width: 80.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                          imagePath,
                          height: 26.h,
                          width: 26.w,
                          color: isSelected
                              ? const Color(0xFF4A90D9)
                              : const Color(0xffC1CEDC),
                        )
                        .animate(target: isSelected ? 1 : 1)
                        .scale(
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1, 1),
                          duration: 300.ms,
                          curve: Curves.easeOutBack,
                        )
                        .fadeIn(duration: 250.ms)
                        .slideY(
                          begin: 0.3,
                          end: 0,
                          duration: 300.ms,
                          curve: Curves.easeOut,
                        )
                        .shimmer(
                          duration: 900.ms,
                          delay: 200.ms,
                          color: isSelected ? Colors.black : Colors.transparent,
                        ),

                    SizedBox(height: 3.h),

                    Text(
                          label,
                          style: GoogleFonts.dmSans(
                            fontSize: 12.sp,

                            color: isSelected
                                ? const Color(0xFF4A90D9)
                                : const Color(0xffC1CEDC),
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        )
                        .animate(target: isSelected ? 1 : 1)
                        .fade(duration: 250.ms)
                        .slideY(
                          begin: 0.4,
                          end: 0,
                          duration: 300.ms,
                          curve: Curves.easeOut,
                        ),
                  ],
                ),
              )
              .animate(target: isSelected ? 1 : 0)
              .scale(
                begin: const Offset(0.95, 0.95),
                end: const Offset(1, 1),
                duration: 250.ms,
                curve: Curves.easeOutBack,
              )
              .then()
              .shake(duration: 350.ms, hz: 3, offset: const Offset(1, 0)),
    );
  }
}
