import 'package:flutter/material.dart';

class Asset {
  static const String logo = 'assets/home/logo.png';
  static const List<String> banners = <String>[
    'assets/home/banner_0.png',
    'assets/home/banner_1.png'
  ];
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

  static const List<String> banners = [
    "Gatgets That Make Your Smartphone Even Smarter",
    "Eagle Eye - Smart Home | Wireless CCTV | IPCamera | Dash Camera"
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
