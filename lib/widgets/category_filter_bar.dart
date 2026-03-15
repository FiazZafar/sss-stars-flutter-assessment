import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilterBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoryFilterBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 16.w,right: 16,bottom: 16.h),
        
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFF0079FF).withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                color: isSelected ? null : const Color(0xFFF0F0F0),
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFF5AB0FF), Color(0xFF0079FF)],
                      )
                    : null,
                borderRadius: isSelected
                    ? BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        bottomLeft: Radius.circular(25.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      )
                    : BorderRadius.circular(14.r),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF555555),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
