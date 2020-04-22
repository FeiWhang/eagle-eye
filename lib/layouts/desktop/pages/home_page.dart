import 'package:eagle_eye/layouts/desktop/providers/scroll_provider.dart';
import 'package:eagle_eye/layouts/desktop/widgets/banners.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ScrollController scrollController;
  final ScrollProvider scrollProvider;

  HomePage({this.scrollProvider, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if ((notification is ScrollStartNotification ||
                notification is ScrollUpdateNotification ||
                notification is ScrollEndNotification) &&
            notification.metrics.pixels <
                scrollController.position.maxScrollExtent) {
          _updateScroll(notification.metrics.pixels);
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 699,
                  child: DesktopBanner(aspectRatio: 21 / 9),
                ),
              ] +
              List<Widget>.generate(
                100,
                (index) => Text(
                  "ITEM: ${index + 1}",
                  textAlign: TextAlign.center,
                ),
              ),
        ),
      ),
    );
  }

  void _updateScroll(double pixel) {
    // set max only once
    if (scrollProvider.maxPixel == null ||
        scrollProvider.maxPixel < scrollController.position.maxScrollExtent) {
      scrollProvider.setMaxPixel(scrollController.position.maxScrollExtent);
    }
    scrollProvider.setMaxPixel(scrollController.position.maxScrollExtent);
    if (pixel <= scrollProvider.maxPixel) {
      scrollProvider.updatePixels(pixel); // update pixel
    }
  }
}
