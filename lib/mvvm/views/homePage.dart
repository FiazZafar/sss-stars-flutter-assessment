// ignore: file_names
import 'dart:ui';

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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48.h),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification) {
                    final delta = notification.scrollDelta ?? 0;
                    final pixels = notification.metrics.pixels;

                    if (pixels < 0) {
                      vm.setNavScrollState(NavScrollState.atTop);
                      return false;
                    }

                    if (pixels <= 10) {
                      vm.setNavScrollState(NavScrollState.atTop);
                      return false;
                    }

                    if (delta > 1.5) {
                      vm.setNavScrollState(NavScrollState.scrollingDown);
                    }
                    else if (delta < -1.5) {
                      vm.setNavScrollState(NavScrollState.scrollingUp);
                    }
                  }

                  if (notification is ScrollEndNotification) {
                    final pixels = notification.metrics.pixels;
                    if (pixels <= 10) {
                      vm.setNavScrollState(NavScrollState.atTop);
                    }
                  }

                  return false;
                },
                child: _buildBody(vm),
              ),
            ),

            Positioned(top: 0, left: 0, right: 0, child: _buildTopTabs(vm)),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomNav(vm),
            ),
          ],
        ),
      ),
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

  Widget _buildTopTabs(HomeViewmodel vm) {
    final Color tabBarColor = switch (vm.navScrollState) {
      NavScrollState.atTop => Colors.white.withOpacity(1.0),
      NavScrollState.scrollingUp => Colors.white.withOpacity(0.25),
      NavScrollState.scrollingDown => Colors.white.withOpacity(0.15),
    };

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AnimatedContainer(
          // height: 86.h,

          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: tabBarColor,
            border: Border(
              bottom: BorderSide(
                color: vm.navScrollState == NavScrollState.atTop
                    ? const Color(0xFFEEEEEE)
                    : Colors.white.withOpacity(0.35),
                width: 0.8,
              ),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF1A1A1A),
            unselectedLabelColor: const Color(0xFFAAAAAA),
            labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: const Color(0xff0079FF),
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'For You'),
              Tab(text: 'Explore'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav(HomeViewmodel vm) {
    final Color navColor = switch (vm.navScrollState) {
      NavScrollState.atTop => Colors.white.withOpacity(1.0),
      NavScrollState.scrollingUp => Colors.white.withOpacity(0.25),
      NavScrollState.scrollingDown => Colors.white.withOpacity(0.15),
    };

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          height: 86.h,
          decoration: BoxDecoration(
            color: navColor,
            border: Border(
              top: BorderSide(
                color: vm.navScrollState == NavScrollState.atTop
                    ? const Color(0xFFEEEEEE)
                    : Colors.white.withOpacity(0.35),
                width: 0.8,
              ),
            ),
          ),
          child: _navBarContent(vm),
        ),
      ),
    );
  }

  Widget _navBarContent(HomeViewmodel vm) {
    return SafeArea(
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
    );
  }
}
