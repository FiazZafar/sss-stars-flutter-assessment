import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/foryou_viewModel.dart';
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
    return ChangeNotifierProvider(
      create: (_) => ForyouViewmodel(),
      child: Consumer<ForyouViewmodel>(
        builder: (context, vm, _) {
          return Column(
            children: [
              const SearchField(),

              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: SizedBox(
                  height: vm.showCategories ? null : 0,
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      CategoryFilterBar(
                        categories: vm.categories,
                        selectedIndex: vm.selectedCategoryIndex,
                        onCategorySelected: vm.selectCategory,
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: CustomScrollView(
                  controller: vm.scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
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
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}