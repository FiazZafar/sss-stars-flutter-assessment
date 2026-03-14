import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/home_viewModel.dart';
import 'package:sss_stars_flutter_assessment/resources/app_assets.dart';
import 'package:sss_stars_flutter_assessment/widgets/explore_tab.dart';
import 'package:sss_stars_flutter_assessment/widgets/foryou_tab.dart';
import 'package:sss_stars_flutter_assessment/widgets/nav_items.dart';

final List<Map<String, String>> banners = [
  {
    'imageUrl':
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800',
    'title': 'Emerging Designers',
    'subtitle':
        'Explore small businesses and discover unique, one-of-a-kind looks.',
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
      bottomNavigationBar: _buildBottomNav(vm),
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
            Icon(Icons.error_outline, size: 48.sp, color: Colors.grey),
            SizedBox(height: 12.h),
            Text(
              vm.message,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
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
          bannerIndex: vm.bannerIndex,
          bannerController: _bannerController,
          onBannerChanged: (i) => vm.setBannerIndex(i),
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
        labelStyle:  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle:  TextStyle(
          fontSize: 15.sp,
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

  Widget _buildBottomNav(HomeViewmodel vm) {
    return Container(
      height: 86.h,
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
                imagePath: AppAssets.shop,
                label: 'Shop',
                isSelected: vm.bottomNavIndex == 0,
                onTap: () => vm.setBottomNavIndex(0),
              ),
              NavItem(
                imagePath: AppAssets.cart,
                label: 'Cart',
                isSelected: vm.bottomNavIndex == 1,
                onTap: () => vm.setBottomNavIndex(1),
              ),
              NavItem(
                imagePath: AppAssets.profile,
                label: 'Profile',
                isSelected: vm.bottomNavIndex == 2,
                onTap: () => vm.setBottomNavIndex(2),
              ),
            ],
          ),
        ),
      ),
    );
  }}
