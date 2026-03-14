import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
import 'package:sss_stars_flutter_assessment/resources/banner.dart';
import 'package:sss_stars_flutter_assessment/resources/silver_grid.dart';

class ForYouTab extends StatelessWidget {
  final List<Map<String, String>> banners;
  final List<ProductItem> products;
  final int bannerIndex;
  final PageController bannerController;
  final ValueChanged<int> onBannerChanged;

  const ForYouTab({super.key, 
    required this.banners,
    required this.products,
    required this.bannerIndex,
    required this.bannerController,
    required this.onBannerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SearchBar()),
        SliverToBoxAdapter(
          child: BannerCarousel(
            banners: banners,
            currentIndex: bannerIndex,
            controller: bannerController,
            onChanged: onBannerChanged,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Text(
              'For You:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A)),
            ),
          ),
        ),
        // ── MASONRY GRID using flutter_staggered_grid_view ──
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          sliver: MasonrySliverGrid(products: products),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
