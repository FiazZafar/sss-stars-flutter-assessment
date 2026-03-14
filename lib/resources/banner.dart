import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  final List<Map<String, String>> banners;
  final int currentIndex;
  final PageController controller;
  final ValueChanged<int> onChanged;

  const BannerCarousel({
    required this.banners,
    required this.currentIndex,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: controller,
            onPageChanged: onChanged,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              final b = banners[index];
              return BannerCard(
                imageUrl: b['imageUrl']!,
                title: b['title']!,
                subtitle: b['subtitle']!,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Animated dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: i == currentIndex ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == currentIndex
                    ? const Color(0xFF4A90D9)
                    : const Color(0xFFCCCCCC),
                borderRadius: BorderRadius.circular(3),
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

  const BannerCard({super.key, 
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
            height: 180,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              
              fit: BoxFit.contain,
              placeholder: (_, __) => Container(
                color: const Color(0xFFF0F0F0),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
              height: 1.1,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF888888),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(21),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Text(
                'Shop Now',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              label: const Icon(Icons.arrow_forward,
                  color: Colors.white, size: 16),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
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
