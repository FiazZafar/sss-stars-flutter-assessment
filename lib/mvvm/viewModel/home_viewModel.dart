import 'package:flutter/foundation.dart';
import 'package:sss_stars_flutter_assessment/Repository/products_repo.dart';
import 'package:sss_stars_flutter_assessment/dataLayer/network_response.dart/network_reponces.dart';
import 'package:sss_stars_flutter_assessment/mvvm/models/product_model.dart';

enum NavScrollState { atTop, scrollingUp, scrollingDown }

class HomeViewmodel extends ChangeNotifier {
  final ProductRepo _repo = ProductRepo.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _message = '';
  String get message => _message;

  List<ProductItem> _productList = [];
  List<ProductItem> get productList => _productList;

  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  int _bannerIndex = 0;
  int get bannerIndex => _bannerIndex;

  void setBannerIndex(int index) {
    _bannerIndex = index;
    notifyListeners();
  }

  NavScrollState _navScrollState = NavScrollState.atTop;
  NavScrollState get navScrollState => _navScrollState;

  void setNavScrollState(NavScrollState state) {
    if (_navScrollState != state) { 
      _navScrollState = state;
      notifyListeners();
    }
  }

  bool get isScrollingDown => _navScrollState == NavScrollState.scrollingDown;

  Future<void> getProducts() async {
    _isLoading = true;
    _message = '';
    notifyListeners();

    final ApiResponces<List<ProductItem>> response =
        await _repo.fetchProducts();

    if (response.status == ResponseStatus.success) {
      _productList = response.data ?? [];
    } else {
      _message = response.message ?? 'Something went wrong';
      print(_message);
    }

    _isLoading = false;
    notifyListeners();
  }
}