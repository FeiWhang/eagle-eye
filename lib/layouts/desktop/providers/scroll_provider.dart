import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  double get progress {
    try {
      return _currentPixels / _maxPixel;
    } catch (e) {
      return 0;
    }
  }

  double get barHeight {
    return (4 / (progress + 0.1)) + 80;
  }

  double _maxPixel;
  double get maxPixel => _maxPixel;
  void setMaxPixel(double pixel) => _maxPixel = pixel;

  double _currentPixels = 0;
  void updatePixels(double pixel) {
    _currentPixels = pixel;
    notifyListeners();
  }
}
