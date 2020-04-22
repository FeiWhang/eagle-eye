import 'package:eagle_eye/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';

class DesktopBanner extends StatelessWidget {
  final double aspectRatio;

  const DesktopBanner({Key key, this.aspectRatio}) : super(key: key);

  Widget _captions(BuildContext context, int index) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 39),
      child: Text(
        Typo.banners[index],
        style: TypoStyle.bannerCaption,
      ),
    );
  }

  Widget eachBanner(BuildContext context, int index) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              Asset.banners[index],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2999),
          ),
          _captions(context, index) ?? _captions(context, index),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 699,
      child: Swiper(
        itemCount: Asset.banners.length,
        itemBuilder: (context, index) {
          return eachBanner(context, index);
        },
        control: SwiperControl(iconNext: null, iconPrevious: null),
        physics: NeverScrollableScrollPhysics(),
        autoplay: true,
        viewportFraction: 1,
      ),
    );
  }
}
