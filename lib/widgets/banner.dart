import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/trending_model.dart';

final List<String> _flagUrls = [
  'https://flagcdn.com/w40/kr.png',
  'https://flagcdn.com/w40/br.png',
  'https://flagcdn.com/w40/us.png',
  'https://flagcdn.com/w40/za.png',
];
final List<TrendingBrand> trendingBrands = [
  TrendingBrand(
    avatarUrl: 'https://i.pravatar.cc/80?img=1',
    name: "Amanda's Boutique",
    description:
        'A modern designer with a youthful spirit, dedicated to hand-making every piece with care....',
  ),
  TrendingBrand(
    avatarUrl: 'https://i.pravatar.cc/80?img=2',
    name: 'Nike',
    description: 'Just Do It',
  ),
  TrendingBrand(
    avatarUrl: 'https://i.pravatar.cc/80?img=2',
    name: 'Nike',
    description:
        'A modern designer with a youthful spirit, dedicated to hand-making every piece with care.',
  ),
];

class BannerCarousel extends StatelessWidget {
  final List<Map<String, String>> banners;
  final int currentIndex;
  final PageController controller;
  final ValueChanged<int> onChanged;

  const BannerCarousel({
    super.key,
    required this.banners,
    required this.currentIndex,
    required this.controller,
    required this.onChanged,
  });

  int get _totalPages => banners.length + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360.h,
          child: PageView.builder(
            controller: controller,
            onPageChanged: onChanged,
            itemCount: _totalPages,
            itemBuilder: (context, index) {
              if (index == _totalPages - 1) {
                return const TrendingBrandsPage();
              }
              final b = banners[index];
              return BannerCard(
                imageUrl: b['imageUrl']!,
                title: b['title']!,
                subtitle: b['subtitle']!,
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              _totalPages,

              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: i == currentIndex ? 16 : 6,
                height: 6.h,
                decoration: BoxDecoration(
                  color: i == currentIndex
                      ? const Color(0xFF0079FF)
                      : const Color(0xFFCCCCCC),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BannerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const BannerCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 200.h,
              width: double.infinity,
              color: const Color(0xFFF08080),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 14),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF212121), Color(0xFF878787), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),

            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w900,
                color: Colors
                    .white, // ✅ White hona chahiye — ShaderMask color override karta hai
                // height: 1.1,
              ),
            ),
          ),
          SizedBox(height: 5.sp),
          Text(
            subtitle,
            style: GoogleFonts.dmSans(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF888888),
              height: 1.4,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: Text(
                'Shop Now',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              label: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 16,
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingBrandsPage extends StatelessWidget {
  const TrendingBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Brands',
            style: GoogleFonts.poppins(
              fontSize: 30.sp,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1A1A1A).withOpacity(0.8),
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Loved by the community, picked by us — these brands are changing the game from the ground up.',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF888888),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),

          SizedBox(
            height: 210.h,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: trendingBrands.length,
              itemBuilder: (context, index) {
                final brand = trendingBrands[index];
                return _BrandTile(brand: brand);
              },
            ),
          ),
          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40.0 + (_flagUrls.length - 1) * 26.0,
                height: 40,
                child: Stack(
                  children: List.generate(_flagUrls.length, (index) {
                    return Positioned(
                      left: index * 26.0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: _flagUrls[index],
                            fit: BoxFit.cover,
                            placeholder: (_, __) =>
                                Container(color: const Color(0xFFF0F0F0)),
                            errorWidget: (_, __, ___) =>
                                Container(color: const Color(0xFFF0F0F0)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Explore the Global Scene  >',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF4A90D9),
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

class _BrandTile extends StatelessWidget {
  final TrendingBrand brand;

  const _BrandTile({required this.brand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: brand.avatarUrl,
              width: 52.r,
              height: 52.r,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 52,
                height: 52,
                color: const Color(0xFFF0F0F0),
              ),
            ),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Text(
                  brand.name,
                  style: GoogleFonts.dmSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A).withOpacity(0.8),
                    height: 1.1,
                  ),
                ),
                if (brand.description != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    brand.description!,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF1A1A1A).withOpacity(0.8),
                      height: 1.1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'More',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0079FF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
