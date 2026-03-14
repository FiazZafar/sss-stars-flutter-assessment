import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/Repository/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepo _repo = AuthRepo.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  String? _message;
  String? get message => _message;

  bool _emailValid = false;
  bool _nameValid = false;
  bool _birthValid = false;
  bool _passwordValid = false;
  bool _phoneValid = false;

  bool get phoneValid => _phoneValid;
  bool get emailValid => _emailValid;
  bool get nameValid => _nameValid;
  bool get birthValid => _birthValid;
  bool get passwordValid => _passwordValid;

  int _activeTab = 0;
  int get activeTab => _activeTab;

  void setActiveTab(int index) {
    _activeTab = index;
    notifyListeners();
  }

  bool get allFieldsValid {
    if (_activeTab == 0) {
      return _emailValid && _nameValid && _birthValid && _passwordValid;
    } else {
      return _phoneValid && _nameValid && _birthValid && _passwordValid;
    }
  }

  void validateEmail(String v) {
    _emailValid = RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$').hasMatch(v.trim());
    notifyListeners();
  }

  void validateUsername(String v) {
    _nameValid =
        v.trim().length >= 3 && RegExp(r'^[a-zA-Z0-9]+$').hasMatch(v.trim());
    notifyListeners();
  }

  void validateBirthDate(String v) {
    _birthValid = v.trim().isNotEmpty;
    notifyListeners();
  }

  void validatePassword(String v) {
    _passwordValid =
        v.length >= 8 &&
        RegExp(r'[a-zA-Z]').hasMatch(v) &&
        RegExp(r'[0-9]').hasMatch(v) &&
        RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(v);
    notifyListeners();
  }

  void validatePhone(String v) {
    _phoneValid = RegExp(
      r'^(\+92|0)[0-9]{2,3}[-\s]?[0-9]{7}$',
    ).hasMatch(v.trim());
    notifyListeners();
  }

  String? formValidatePhone(String? v) =>
      _phoneValid ? null : 'Invalid phone number';

  String? formValidateEmail(String? v) => _emailValid ? null : 'Invalid email';

  String? formValidateUsername(String? v) =>
      _nameValid ? null : 'Invalid username';

  String? formValidateBirthDate(String? v) => _birthValid ? null : 'Required';

  String? formValidatePassword(String? v) =>
      _passwordValid ? null : 'Invalid password';

  Future<void> registerUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final result = await _repo.registerUser(email, password);

    _isLoading = false;
    _isSuccess = result.success;
    _message = result.message;

    notifyListeners();
  }

  void resetValidation() {
    _emailValid = false;
    _nameValid = false;
    _birthValid = false;
    _passwordValid = false;
    notifyListeners();
  }
}
