import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/home_viewModel.dart';
import 'package:sss_stars_flutter_assessment/resources/app_assets.dart';
import 'package:sss_stars_flutter_assessment/widgets/explore_tab.dart';
import 'package:sss_stars_flutter_assessment/widgets/foryou_tab.dart';
import 'package:sss_stars_flutter_assessment/widgets/nav_items.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewmodel>().getProducts();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewmodel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopTabs(),
            Expanded(child: _buildBody(vm)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBody(HomeViewmodel vm) {
    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.message.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              vm.message,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => vm.getProducts(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (vm.productList.isEmpty) {
      return const Center(child: Text('No products available'));
    }

    return TabBarView(
      controller: _tabController,
      children: [
        ForYouTab(
          banners: banners,
          products: vm.productList,
          bannerIndex: vm.bannerIndex, // ✅ from VM
          bannerController: _bannerController,
          onBannerChanged: (i) => vm.setBannerIndex(i), // ✅ VM call
        ),
        ExploreTab(products: vm.productList),
      ],
    );
  }

  Widget _buildTopTabs() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF1A1A1A),
        unselectedLabelColor: const Color(0xFFAAAAAA),
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: const Color(0xFF4A90D9),
        indicatorWeight: 2.5,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'For You'),
          Tab(text: 'Explore'),
        ],
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
              NavItem(
                icon: Icons.storefront_rounded,
                label: 'Shop',
                isSelected: _bottomNavIndex == 0,
                onTap: () => setState(() => _bottomNavIndex = 0),
              ),
              NavItem(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                isSelected: _bottomNavIndex == 1,
                onTap: () => setState(() => _bottomNavIndex = 1),
              ),
              NavItem(
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
