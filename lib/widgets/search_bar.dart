import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sss_stars_flutter_assessment/resources/app_assets.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
             Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20.h),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Search your product...',
                style: TextStyle(fontSize: 13, color: Color(0xFFBBBBBB)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                AppAssets.filterIcon, 
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarWithAvatar extends StatelessWidget {
  const SearchBarWithAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                   Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20.h),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Air Jordan 1, dark mocha',
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(AppAssets.filterIcon,height: 24.h,width: 24.w,),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0079FF), width: 2),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: 'https://i.pravatar.cc/80?img=10',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0079FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
