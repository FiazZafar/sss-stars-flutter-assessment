import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';
import 'package:sss_stars_flutter_assessment/resources/product_card.dart';

class MasonrySliverGrid extends StatelessWidget {
  final List<ProductItem> products;
  const MasonrySliverGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
      childCount: products.length,
    );
  }
}

