import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  SplashViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }
}
