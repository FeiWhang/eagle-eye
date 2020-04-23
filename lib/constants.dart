import 'package:flutter/material.dart';

class Asset {
  static const String logo = 'assets/home/logo.png';
  static const List<String> banners = <String>[
    'assets/home/banner_0.png',
    'assets/home/banner_1.png'
  ];

  static const String facebook = "assets/home/social/facebook.png";
  static const String youtube = "assets/home/social/youtube.png";
  static const String line = "assets/home/social/line.png";

  static const List<String> homeShowcases = <String>[
    "assets/home/product_showcase/showcase0.png",
    "assets/home/product_showcase/showcase1.png",
    "assets/home/product_showcase/showcase2.png"
  ];

  static const List<String> homeRecommended = <String>[
    "assets/home/recommended/project_0.png",
    "assets/home/recommended/project_1.png",
    "assets/home/recommended/project_2.png",
    "assets/home/recommended/project_3.png",
    "assets/home/recommended/project_4.png"
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
    // length should be controled
    "Gatgets That Make Your Smartphone Even Smarter",
    "Eagle Eye - Smart Home | Wireless CCTV | Dash Camera"
  ];

  // get-started bar
  static const String getStarted = "Get Started";
  static const String getStartedQuoted =
      "The fastest way to grow your business with the leader in Technology";
  static const String getStartedCaption =
      "Check out our options and features included";

  static const List<String> homeShowcasesType = [
    "New !",
    "Recommended !",
    "Best Seller !",
  ];

  static const List<String> homeShowcasesTitle = [
    "Eagle Eye : L808",
    "Eagle Eye : Smart Alarm Set",
    "Eagle Eye : Robot Sim Camera",
  ];

  static const List<String> homeShowcasesSubtitle = [
    "There are so many styles you can combine that is possible to create almost any kind of layout based on Porto Template, navigate in our preview and see the header variations, the colors, and the page content types that you will be able to use.",
    "With our exlusive Style Switcher you will be able to choose any color you want for your website, choose the layout style (wide / boxed), website type (one page / normal), then generate the css that will be compiled by a {less} proccessor.",
    "There are so many styles you can combine that is possible to create almost any kind of layout based on Porto Template, navigate in our preview and see the header variations, the colors, and the page content types that you will be able to use.",
  ];

  static const String readMore = "Read More";
  static const String recommended = "Recommended Products";
  static const String products = "Products";

  static const List<String> recommendedProducts = <String>[
    "EAGLE EYE-360° Panoramic Bulb Wireless Camera",
    "EAGLE EYE-360° Panoramic Camera",
    "IP Smart Camera with Rechargeable Battery",
    "Smart Doorbell Set",
    "IP Smart Camera With Sim",
  ];

  static const List<String> recommendedProductsCode = <String>[
    "EG-IPCB1.3",
    "EG-FV3601",
    "EG-AB07-2.0MP",
    "EG-DB2618",
    "EG-IPLB015",
  ];
}

class TypoStyle {
  static final TextStyle bannerCaption = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle whiteTitle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle whiteSubtitle = TextStyle(
    color: Colors.grey[300],
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle blackTitle = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle blackSubtitle = TextStyle(
    color: Colors.grey[600],
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle readMore = TextStyle(
    color: AppColor.accent1,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

class URL {
  // social media
  static const String facebook = "https://www.facebook.com/eagleeyeTH/";
  static const String youtube =
      "https://www.youtube.com/channel/UC2AmuaHgNyGCuwNSiB08bzw/videos";
  static const String line = "https://line.me/R/ti/p/%40eagleeye";
}

class AppColor {
  static const Color accent0 = Color.fromRGBO(38, 169, 225, 1);
  static const Color accent1 = Color.fromRGBO(3, 121, 191, 1);

  static const LinearGradient menuGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent0, accent1],
  );
  static const LinearGradient scrollGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.white, accent1],
  );

  static final Color darkFilter = Colors.black.withOpacity(0.69999);
}
