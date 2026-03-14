import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductItem product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: product.aspectRatio ?? 1.0,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl ?? 'N/A',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: const Color(0xFFEEEEEE),
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: const Color(0xFFEEEEEE),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.78),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      CachedNetworkImageProvider(product.sellerAvatar ?? 'N/A'),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    product.title ?? 'N/A',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  product.price ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
