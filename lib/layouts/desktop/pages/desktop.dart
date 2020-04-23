import 'package:eagle_eye/layouts/desktop/pages/product_page.dart';
import 'package:eagle_eye/layouts/desktop/pages/support_page.dart';
import 'package:eagle_eye/layouts/desktop/providers/scroll_provider.dart';
import 'package:eagle_eye/layouts/desktop/widgets/appbar.dart';
import 'package:eagle_eye/layouts/desktop/widgets/social_media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'about_page.dart';
import 'contact_page.dart';
import 'event_page.dart';
import 'home_page.dart';

class Desktop extends StatelessWidget {
  final int pageIndex;
  const Desktop({Key key, this.pageIndex}) : super(key: key);

  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return ChangeNotifierProvider<ScrollProvider>(
      create: (BuildContext context) => ScrollProvider(),
      child: Consumer<ScrollProvider>(
        builder: (BuildContext context, ScrollProvider scrollProvider,
            Widget child) {
          Widget body;
          switch (pageIndex) {
            case 0:
              body = HomeBody();
              break;
            case 1:
              body = AboutPage();
              break;
            case 2:
              body = ProductPage();
              break;
            case 3:
              body = SupportPage();
              break;
            case 4:
              body = EventPage();
              break;
            case 5:
              body = ContactPage();
              break;
            default:
          }

          return Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if ((notification is ScrollStartNotification ||
                        notification is ScrollUpdateNotification ||
                        notification is ScrollEndNotification) &&
                    notification.metrics.pixels <
                        scrollController.position.maxScrollExtent) {
                  double pixel = notification.metrics.pixels;
                  double maxPixel = scrollController.position.maxScrollExtent;

                  if (pixel < maxPixel) {
                    scrollProvider.updatePixels(notification.metrics.pixels);
                  }
                  if (scrollProvider.maxPixel == null ||
                      maxPixel > scrollProvider.maxPixel) {
                    scrollProvider.setMaxPixel(maxPixel);
                  }
                }
                return true;
              },
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                      DesktopBar(
                        pageIndex: pageIndex,
                        scrollProvider: scrollProvider,
                      )
                    ] +
                    <Widget>[body],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: socialMedia(),
            ),
          );
        },
      ),
    );
  }
}
