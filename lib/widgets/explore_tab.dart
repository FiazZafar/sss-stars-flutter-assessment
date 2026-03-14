
import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
import 'package:sss_stars_flutter_assessment/widgets/search_bar.dart';
import 'package:sss_stars_flutter_assessment/widgets/silver_grid.dart';

class ExploreTab extends StatelessWidget {
  final List<ProductItem> products;
  const ExploreTab({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SearchBarWithAvatar()),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          sliver: MasonrySliverGrid(products: products),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
