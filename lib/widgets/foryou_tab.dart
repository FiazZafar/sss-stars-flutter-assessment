import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/foryou_viewModel.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/home_viewModel.dart';
import 'package:sss_stars_flutter_assessment/widgets/banner.dart';
import 'package:sss_stars_flutter_assessment/widgets/search_bar.dart';
import 'package:sss_stars_flutter_assessment/widgets/silver_grid.dart';
import 'package:sss_stars_flutter_assessment/widgets/category_filter_bar.dart';

class ForYouTab extends StatelessWidget {
  final List<Map<String, String>> banners;
  final List<ProductItem> products;
  final int bannerIndex;
  final PageController bannerController;
  final ValueChanged<int> onBannerChanged;

  const ForYouTab({
    super.key,
    required this.banners,
    required this.products,
    required this.bannerIndex,
    required this.bannerController,
    required this.onBannerChanged,
  });

  @override
  Widget build(BuildContext context) {
    final homeVm = context.watch<HomeViewmodel>();

    return Consumer<ForyouViewmodel>(
      builder: (context, vm, _) {
        final double headerOpacity = switch (homeVm.navScrollState) {
          NavScrollState.atTop => 1.0,
          NavScrollState.scrollingUp => 0.25,
          NavScrollState.scrollingDown => 0.15,
        };

        return Stack(
          children: [
            CustomScrollView(
              controller: vm.scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: vm.showCategories ? 128.h : 68.h,
                  ),
                ),

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
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: MasonrySliverGrid(products: products),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    height: vm.showCategories ? 128.h : 68.h,
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(headerOpacity),
                    child: ClipRect(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SearchField(),
                          SizedBox(height: 10.h),

                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            height: vm.showCategories ? 56.h : 0,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: vm.showCategories ? 1.0 : 0.0,
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    CategoryFilterBar(
                                      categories: vm.categories,
                                      selectedIndex: vm.selectedCategoryIndex,
                                      onCategorySelected: vm.selectCategory,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
