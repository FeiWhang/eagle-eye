import 'package:eagle_eye/constants.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/carousel/gf_carousel.dart';
import 'package:provider/provider.dart';

class Banners extends StatelessWidget {
  const Banners({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BannersProvider>(
      create: (BuildContext context) => BannersProvider(),
      child: Consumer<BannersProvider>(
        builder: (context, value, child) {
          return GFCarousel(
            autoPlay: true,
            enlargeMainPage: true,
            viewportFraction: 1,
            items: value.banners
                .map(
                  (banner) => ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
            onPageChanged: (index) => value.setIndex(index),
          );
        },
      ),
    );
  }
}

class BannersProvider extends ChangeNotifier {
  int _index = 0;
  get index => _index;
  void setIndex(int index) {
    _index = index;
  }

  List<String> banners = [
    Asset.banners0,
    Asset.banners1,
  ];
}
