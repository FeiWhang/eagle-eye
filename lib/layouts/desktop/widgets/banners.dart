import 'package:eagle_eye/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';

class DesktopBanner extends StatelessWidget {
  final double aspectRatio;

  const DesktopBanner({Key key, this.aspectRatio}) : super(key: key);

  Widget eachBanner(BuildContext context, int index) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 599,
              child: Image.asset(
                Asset.banners[index],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2999),
            ),
            Container(
              alignment: Alignment.lerp(
                  Alignment.bottomCenter, Alignment.bottomLeft, 0.39),
              margin: const EdgeInsets.only(bottom: 49.99),
              child: Text(
                Typo.banners[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: Asset.banners.length,
      itemBuilder: (context, index) {
        return eachBanner(context, index);
      },
      control: SwiperControl(iconNext: null, iconPrevious: null),
      physics: NeverScrollableScrollPhysics(),
      autoplay: true,
      viewportFraction: 1,
    ).showButtunOnHover;
  }
}
