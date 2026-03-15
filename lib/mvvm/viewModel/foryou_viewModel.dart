import 'dart:async';
import 'package:flutter/material.dart';

class ForyouViewmodel extends ChangeNotifier {
  bool _showCategories = true;
  bool get showCategories => _showCategories;

  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  final List<String> categories = [
    'For You', 'Men', 'Women', 'Jackets', 'Sneakers', 'Hoodies', 'Pants',
  ];

  final ScrollController scrollController = ScrollController();
  double _lastOffset = 0;
  bool _isCoolingDown = false;
  Timer? _cooldownTimer;

  static const double _pullThreshold = -110.0;
  static const double _hideThreshold = 6.0;
  static const Duration _cooldownDuration = Duration(milliseconds: 350);

  ForyouViewmodel() {
    scrollController.addListener(_onScroll);
  }


  void selectCategory(int index) {
    if (_selectedCategoryIndex != index) {
      _selectedCategoryIndex = index;
      notifyListeners();
    }
  }


  void _onScroll() {
    if (!scrollController.hasClients) return;
    final offset = scrollController.offset;

    if (offset < _pullThreshold) {
      _setShowCategories(true);
      _lastOffset = 0;
      return;
    }

    if (offset <= 0) {
      _lastOffset = 0;
      return;
    }

    if (_isCoolingDown) {
      _lastOffset = offset;
      return;
    }

    final delta = offset - _lastOffset;

    if (delta > _hideThreshold) {
      _setShowCategories(false);
      return;
    }

    _lastOffset = offset;
  }

  void _setShowCategories(bool value) {
    if (_showCategories != value) {
      _showCategories = value;
      notifyListeners();
      _startCooldown();
    }
  }

  void _startCooldown() {
    _isCoolingDown = true;
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer(_cooldownDuration, () {
      _isCoolingDown = false;
    });
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}