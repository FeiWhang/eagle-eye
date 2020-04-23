import 'package:flutter/material.dart';

class ScaleProvider extends ChangeNotifier {
  bool _hovering = false;
  get hovering => _hovering;
  void setHovering(bool isHovering) {
    _hovering = isHovering;
    notifyListeners();
  }

  get scale => _hovering ? 1.59 : 3.39;
}
