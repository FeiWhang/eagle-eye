import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/desktop/providers/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DesktopBanner extends StatelessWidget {
  final double aspectRatio;
  final ScrollProvider scrollProvider;
  final Color filter;

  const DesktopBanner(
      {Key key, this.aspectRatio, this.scrollProvider, this.filter})
      : super(key: key);

  // Widget _captions(BuildContext context, int index) {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //       height: 60,
  //       width: 888,
  //       alignment: Alignment.center,
  //       margin: EdgeInsets.only(bottom: 39),
  //       child: Text(
  //         Typo.banners[index],
  //         style: TypoStyle.bannerCaption,
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

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
            color: filter,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 769,
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
      ),
    );
  }
}
