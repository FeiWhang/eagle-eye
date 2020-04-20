import 'package:flutter/material.dart';

class Asset {
  static const String logo = 'assets/home/logo.png';
  static const String banners0 = 'assets/home/banner_0.png';
  static const String banners1 = 'assets/home/banner_1.png';
}

class Typo {
  static const List<String> menus = [
    'HOME',
    'ABOUT US',
    'PRODUCTS',
    'SUPPORT',
    'EVENT/NEWS',
    'CONTACT US'
  ];
}

class AppColor {
  static const Color accent0 = Color.fromRGBO(38, 169, 225, 1);
  static const Color accent1 = Color.fromRGBO(3, 121, 191, 1);

  static const LinearGradient menuGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent0, accent1],
  );
}
