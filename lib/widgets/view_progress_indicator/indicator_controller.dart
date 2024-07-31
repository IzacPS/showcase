import 'package:flutter/material.dart';

class IndicatorController extends ChangeNotifier {
  IndicatorController({required int numItems, int currentIndicator = 0})
      : _numItems = numItems,
        _currentIndicator = currentIndicator;

  final int _numItems;
  int _currentIndicator;

  int get currentIndicator => _currentIndicator;
  int get numItems => _numItems;

  void nextIndicator() {
    _currentIndicator = (++_currentIndicator).clamp(0, _numItems - 1);
    notifyListeners();
  }

  void previousIndicator() {
    _currentIndicator = (--_currentIndicator).clamp(0, _numItems - 1);
    notifyListeners();
  }

  void setIndicator(int indexIndicator) {
    _currentIndicator = indexIndicator;
    notifyListeners();
  }
}
