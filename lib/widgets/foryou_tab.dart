// import 'package:flutter/material.dart';
// import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
// import 'package:sss_stars_flutter_assessment/resources/banner.dart';
// import 'package:sss_stars_flutter_assessment/resources/search_bar.dart';
// import 'package:sss_stars_flutter_assessment/resources/silver_grid.dart';
// import 'package:sss_stars_flutter_assessment/widgets/category_filter_bar.dart';

// class ForYouTab extends StatefulWidget {
//   final List<Map<String, String>> banners;
//   final List<ProductItem> products;
//   final int bannerIndex;
//   final PageController bannerController;
//   final ValueChanged<int> onBannerChanged;

//   const ForYouTab({
//     super.key,
//     required this.banners,
//     required this.products,
//     required this.bannerIndex,
//     required this.bannerController,
//     required this.onBannerChanged,
//   });

//   @override
//   State<ForYouTab> createState() => _ForYouTabState();
// }

// class _ForYouTabState extends State<ForYouTab> {
//   final ScrollController _scrollController = ScrollController();
//   bool _showCategories = true;
//   double _lastOffset = 0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     final current = _scrollController.offset;

//     // ✅ remove unused maxScroll variable

//     // ✅ pull down past top → show tabs
//     if (current <= 0) {
//       if (!_showCategories) setState(() => _showCategories = true);
//       _lastOffset = current;
//       return;
//     }

//     // ✅ scrolling down → hide tabs
//     if (current > _lastOffset + 5 && _showCategories) {
//       // +5 threshold prevents flickering on tiny movements
//       setState(() => _showCategories = false);
//     }
//     // ✅ scrolling up → show tabs
//     else if (current < _lastOffset - 5 && !_showCategories) {
//       setState(() => _showCategories = true);
//     }

//     _lastOffset = current;
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       controller: _scrollController, // ✅ attach controller
//       // ✅ replace this line in CustomScrollView
//       physics: const BouncingScrollPhysics(
//         parent: AlwaysScrollableScrollPhysics(),
//       ),
//       slivers: [
//         SliverToBoxAdapter(child: SearchField()),

//         // ✅ animated show/hide — no rebuild of other widgets
//         SliverToBoxAdapter(
//           child: AnimatedSize(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             child: _showCategories
//                 ? const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: CategoryFilterBar(),
//                   )
//                 : const SizedBox.shrink(),
//           ),
//         ),

//         SliverToBoxAdapter(
//           child: BannerCarousel(
//             banners: widget.banners,
//             currentIndex: widget.bannerIndex,
//             controller: widget.bannerController,
//             onChanged: widget.onBannerChanged,
//           ),
//         ),
//         const SliverToBoxAdapter(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
//             child: Text(
//               'For You:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF1A1A1A),
//               ),
//             ),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           sliver: MasonrySliverGrid(products: widget.products),
//         ),
//         const SliverToBoxAdapter(child: SizedBox(height: 16)),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
import 'package:sss_stars_flutter_assessment/widgets/banner.dart';
import 'package:sss_stars_flutter_assessment/widgets/search_bar.dart';
import 'package:sss_stars_flutter_assessment/widgets/silver_grid.dart';
import 'package:sss_stars_flutter_assessment/widgets/category_filter_bar.dart';

class ForYouTab extends StatefulWidget {
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
  State<ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<ForYouTab> {
  final ScrollController _scrollController = ScrollController();
  bool _showCategories = true;
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final current = _scrollController.offset;

    if (current <= 0) {
      if (!_showCategories) setState(() => _showCategories = true);
      _lastOffset = current;
      return;
    }

    if (current > _lastOffset + 5 && _showCategories) {
      setState(() => _showCategories = false);
    }
    else if (current < _lastOffset - 5 && !_showCategories) {
      setState(() => _showCategories = true);
    }

    _lastOffset = current;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverToBoxAdapter(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _showCategories
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchField(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CategoryFilterBar(),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ),

        SliverToBoxAdapter(
          child: BannerCarousel(
            banners: widget.banners,
            currentIndex: widget.bannerIndex,
            controller: widget.bannerController,
            onChanged: widget.onBannerChanged,
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
          sliver: MasonrySliverGrid(products: widget.products),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}