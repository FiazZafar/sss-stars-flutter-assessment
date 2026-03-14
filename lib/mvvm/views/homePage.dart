import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';


final List<ProductItem> dummyProducts = [
  ProductItem(
    id: '1',
    imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    title: 'Box Fit Minecraft Tee',
    price: 'R4 999.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=1',
    aspectRatio: 0.75,
  ),
  ProductItem(
    id: '2',
    imageUrl: 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=400',
    title: 'Box Fit Minecraft Tee',
    price: 'R4 999.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=2',
    aspectRatio: 1.2,
  ),
  ProductItem(
    id: '3',
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    title: 'Colour Between...',
    price: 'R16 999.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=3',
    aspectRatio: 1.1,
  ),
  ProductItem(
    id: '4',
    imageUrl: 'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=400',
    title: 'HAD Graphic Tee',
    price: 'R8 999.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=4',
    aspectRatio: 0.8,
  ),
  ProductItem(
    id: '5',
    imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=400',
    title: 'Nike Air Max 270',
    price: 'R9 999.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=5',
    aspectRatio: 0.7,
  ),
  ProductItem(
    id: '6',
    imageUrl: 'https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?w=400',
    title: 'Jordan 1 Retro High',
    price: 'R11 500.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=6',
    aspectRatio: 1.3,
  ),
  ProductItem(
    id: '7',
    imageUrl: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400',
    title: 'Oversized Hoodie',
    price: 'R5 200.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=7',
    aspectRatio: 0.85,
  ),
  ProductItem(
    id: '8',
    imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f15732ce?w=400',
    title: 'Cargo Pants Wide',
    price: 'R7 800.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=8',
    aspectRatio: 1.0,
  ),
  ProductItem(
    id: '9',
    imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400',
    title: 'Air Force 1 Low',
    price: 'R6 499.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=9',
    aspectRatio: 0.72,
  ),
  ProductItem(
    id: '10',
    imageUrl: 'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400',
    title: 'Chunky Sneaker White',
    price: 'R8 200.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=10',
    aspectRatio: 1.25,
  ),
  ProductItem(
    id: '11',
    imageUrl: 'https://images.unsplash.com/photo-1529720317453-c8da503f2051?w=400',
    title: 'Graphic Bomber Jacket',
    price: 'R13 750.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=11',
    aspectRatio: 0.78,
  ),
  ProductItem(
    id: '12',
    imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400',
    title: 'Puffer Jacket Olive',
    price: 'R10 300.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=12',
    aspectRatio: 0.68,
  ),
  ProductItem(
    id: '13',
    imageUrl: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=400',
    title: 'Streetwear Set Black',
    price: 'R14 999.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=13',
    aspectRatio: 1.15,
  ),
  ProductItem(
    id: '14',
    imageUrl: 'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=400',
    title: 'Slim Fit Chino',
    price: 'R4 800.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=14',
    aspectRatio: 0.65,
  ),
  ProductItem(
    id: '15',
    imageUrl: 'https://images.unsplash.com/photo-1604176354204-9268737828e4?w=400',
    title: 'Retro Cap Beige',
    price: 'R2 199.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=15',
    aspectRatio: 1.1,
  ),
  ProductItem(
    id: '16',
    imageUrl: 'https://images.unsplash.com/photo-1516826957135-700dedea698c?w=400',
    title: 'Linen Shirt Cream',
    price: 'R3 650.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=16',
    aspectRatio: 0.82,
  ),
  ProductItem(
    id: '17',
    imageUrl: 'https://images.unsplash.com/photo-1571945153237-4929e783af4a?w=400',
    title: 'Knit Polo Navy',
    price: 'R5 100.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=17',
    aspectRatio: 0.9,
  ),
  ProductItem(
    id: '18',
    imageUrl: 'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?w=400',
    title: 'Slide Sandals Brown',
    price: 'R3 299.99',
    sellerAvatar: 'https://i.pravatar.cc/40?img=18',
    aspectRatio: 1.3,
  ),
  ProductItem(
    id: '19',
    imageUrl: 'https://images.unsplash.com/photo-1540574163026-643ea20ade25?w=400',
    title: 'Denim Jacket Washed',
    price: 'R9 450.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=19',
    aspectRatio: 0.76,
  ),
  ProductItem(
    id: '20',
    imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
    title: 'Tailored Blazer Grey',
    price: 'R18 000.00',
    sellerAvatar: 'https://i.pravatar.cc/40?img=20',
    aspectRatio: 1.05,
  ),
];

final List<Map<String, String>> banners = [
  {
    'imageUrl':
        'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800',
    'title': 'Emerging Designers',
    'subtitle':
        'Explore small businesses and discover unique, one-of-a-kind looks.',
  },
  {
    'imageUrl':
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
    'title': 'New Arrivals',
    'subtitle':
        'Fresh drops every week. Be the first to get the latest styles.',
  },
];


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _bottomNavIndex = 0;
  int _bannerIndex = 0;
  final PageController _bannerController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopTabs(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _ForYouTab(
                    banners: banners,
                    products: dummyProducts,
                    bannerIndex: _bannerIndex,
                    bannerController: _bannerController,
                    onBannerChanged: (i) =>
                        setState(() => _bannerIndex = i),
                  ),
                  _ExploreTab(products: dummyProducts),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF1A1A1A),
        unselectedLabelColor: const Color(0xFFAAAAAA),
        labelStyle:
            const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        indicatorColor: const Color(0xFF4A90D9),
        indicatorWeight: 2.5,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: const [Tab(text: 'For You'), Tab(text: 'Explore')],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(
                icon: Icons.storefront_rounded,
                label: 'Shop',
                isSelected: _bottomNavIndex == 0,
                onTap: () => setState(() => _bottomNavIndex = 0),
              ),
              _NavItem(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                isSelected: _bottomNavIndex == 1,
                onTap: () => setState(() => _bottomNavIndex = 1),
              ),
              _NavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                isSelected: _bottomNavIndex == 2,
                onTap: () => setState(() => _bottomNavIndex = 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// FOR YOU TAB
// ============================================================
class _ForYouTab extends StatelessWidget {
  final List<Map<String, String>> banners;
  final List<ProductItem> products;
  final int bannerIndex;
  final PageController bannerController;
  final ValueChanged<int> onBannerChanged;

  const _ForYouTab({
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
        SliverToBoxAdapter(child: _SearchBar()),
        SliverToBoxAdapter(
          child: _BannerCarousel(
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
          sliver: _MasonrySliverGrid(products: products),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}

// ============================================================
// EXPLORE TAB
// ============================================================
class _ExploreTab extends StatelessWidget {
  final List<ProductItem> products;
  const _ExploreTab({required this.products});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _SearchBarWithAvatar()),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          sliver: _MasonrySliverGrid(products: products),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}

// ============================================================
// ★ THE MASONRY SLIVER GRID
//   Uses MasonryGridView.count from flutter_staggered_grid_view
//   Each card height = (cardWidth / aspectRatio) automatically
//   So portrait images → tall cards, landscape → short cards
// ============================================================
class _MasonrySliverGrid extends StatelessWidget {
  final List<ProductItem> products;
  const _MasonrySliverGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      // ✅ correct API — just itemBuilder + itemCount, no childDelegate
      itemBuilder: (context, index) {
        final product = products[index];
        return _ProductCard(product: product);
      },
      childCount: products.length,
    );
  }
}

// ============================================================
// PRODUCT CARD
// The height is driven by the image's aspect ratio:
//   AspectRatio widget forces the image container to match
//   whatever ratio came from the backend.
//   portrait (0.7) → tall   landscape (1.3) → short
// ============================================================
class _ProductCard extends StatelessWidget {
  final ProductItem product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        children: [
          // ── Image sized by aspect ratio from backend ────
          AspectRatio(
            aspectRatio: product.aspectRatio,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
              // Shimmer placeholder while loading
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

          // ── Gradient overlay at bottom ──────────────────
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

          // ── Seller avatar + title + price ───────────────
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Seller avatar
                CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      CachedNetworkImageProvider(product.sellerAvatar),
                ),
                const SizedBox(width: 5),
                // Product title
                Expanded(
                  child: Text(
                    product.title,
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
                // Price
                Text(
                  product.price,
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

// ============================================================
// SEARCH BAR (For You tab)
// ============================================================
class _SearchBar extends StatelessWidget {
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
            const Icon(Icons.search, color: Color(0xFFAAAAAA), size: 20),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Search your product...',
                style:
                    TextStyle(fontSize: 13, color: Color(0xFFBBBBBB)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.tune,
                color: Color(0xFF4A90D9),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SEARCH BAR WITH AVATAR (Explore tab)
// ============================================================
class _SearchBarWithAvatar extends StatelessWidget {
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
                  const Icon(Icons.search,
                      color: Color(0xFFAAAAAA), size: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Air Jordan 1, dark mocha',
                      style: TextStyle(
                          fontSize: 13, color: Color(0xFF888888)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.tune,
                        color: Color(0xFF4A90D9), size: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Avatar with notification badge
          Stack(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFF4A90D9), width: 2),
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
                    color: Color(0xFF4A90D9),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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

// ============================================================
// BANNER CAROUSEL
// ============================================================
class _BannerCarousel extends StatelessWidget {
  final List<Map<String, String>> banners;
  final int currentIndex;
  final PageController controller;
  final ValueChanged<int> onChanged;

  const _BannerCarousel({
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
              return _BannerCard(
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

class _BannerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const _BannerCard({
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

// ============================================================
// BOTTOM NAV ITEM
// ============================================================
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? const Color(0xFF4A90D9)
        : const Color(0xFFAAAAAA);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF4A90D9).withOpacity(0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}