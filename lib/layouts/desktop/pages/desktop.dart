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
    final ScrollController _scrollController = ScrollController();

    return ChangeNotifierProvider<ScrollProvider>(
      create: (BuildContext context) => ScrollProvider(),
      child: Consumer<ScrollProvider>(
        builder: (BuildContext context, ScrollProvider scrollProvider,
            Widget child) {
          Widget desktopChild;

          switch (pageIndex) {
            case 0:
              desktopChild = HomePage(
                  scrollProvider: scrollProvider,
                  scrollController: _scrollController);
              break;
            case 1:
              desktopChild = AboutPage();
              break;
            case 2:
              desktopChild = ProductPage();
              break;
            case 3:
              desktopChild = SupportPage();
              break;
            case 4:
              desktopChild = EventPage();
              break;
            case 5:
              desktopChild = ContactPage();
              break;
            default:
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(scrollProvider.barHeight + 2),
              child: OverflowBox(
                maxHeight: 129,
                child: DesktopBar(
                    pageIndex: pageIndex, scrollProvider: scrollProvider),
              ),
            ),
            body: desktopChild,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: socialMedia(),
            ),
          );
        },
      ),
    );
  }
}
