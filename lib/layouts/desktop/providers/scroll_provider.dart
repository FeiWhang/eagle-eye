import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  double get progress {
    try {
      return _currentPixels / (_maxPixel - 119);
    } catch (e) {
      return 0;
    }
  }

  double _maxPixel;
  double get maxPixel => _maxPixel;
  void setMaxPixel(double pixel) => _maxPixel = pixel;

  double _currentPixels = 0;
  void updatePixels(double pixel) {
    if (_maxPixel != null && pixel < _maxPixel) {
      _currentPixels = pixel;
      notifyListeners();
    }
  }
}
