import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/desktop/providers/scroll_provider.dart';
import 'package:eagle_eye/layouts/desktop/routing/locator.dart';
import 'package:eagle_eye/layouts/desktop/routing/navigation_service.dart';
import 'package:eagle_eye/layouts/desktop/routing/route_names.dart';
import 'package:eagle_eye/layouts/desktop/widgets/banners.dart';
import 'package:flutter/material.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';
import 'package:flutter/rendering.dart';

class DesktopBar extends StatelessWidget {
  final int pageIndex;
  final ScrollProvider scrollProvider;

  const DesktopBar({Key key, this.pageIndex, this.scrollProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: DesktopBarDelegate(
        minExtent: 129,
        maxExtent: 769,
        scrollProvider: scrollProvider,
        pageIndex: pageIndex,
      ),
    );
  }
}

class ScrollProgress extends StatelessWidget {
  final double progress;

  const ScrollProgress({Key key, this.progress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 3.99,
      padding: EdgeInsets.all(0),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.accent1),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () =>
            locator<NavigationService>().navigateTo(HomeRoute), // pressed home
        child: Image.asset(
          Asset.logo,
          alignment: Alignment.center,
          height: 100,
          width: 180,
          fit: BoxFit.cover,
        ).showCursorOnHover,
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final int index;
  final int pageIndex;
  final Color menuTextColor;

  const _BarItem({Key key, this.index, this.pageIndex, this.menuTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient;
    FontWeight fontWeight = FontWeight.normal;
    Color textColor = menuTextColor;

    if (index == pageIndex) {
      gradient = AppColor.menuGradient;
      fontWeight = FontWeight.bold;
      textColor = Colors.white;
    }

    // Navigate when pressed
    String _routeName;
    switch (index) {
      case 0:
        _routeName = HomeRoute;

        break;
      case 1:
        _routeName = AboutRoute;
        break;
      case 2:
        _routeName = ProductRoute;
        break;
      case 3:
        _routeName = SupportRoute;
        break;
      case 4:
        _routeName = EventRoute;
        break;
      case 5:
        _routeName = ContactRoute;
        break;
      default:
    }

    // final MenuProvider menuProvider = Provider.of<MenuProvider>(context);
    return Container(
      width: 140,
      height: 39,
      margin: EdgeInsets.only(left: 2, right: 2, top: 29),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(32),
      ),
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Text(
            Typo.menus[index],
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              letterSpacing: 1,
              fontWeight: fontWeight,
            ),
          ),
          onPressed: () {
            locator<NavigationService>().navigateTo(_routeName);
            // menuProvider.setPageIndex(index);
          }),
    ).showCursorOnHover.moveUpOnHover;
  }
}

class DesktopBarDelegate implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final ScrollProvider scrollProvider;
  final int pageIndex;

  DesktopBarDelegate(
      {this.pageIndex, this.scrollProvider, this.minExtent, this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: DesktopBanner(
            aspectRatio: 21 / 9,
            scrollProvider: scrollProvider,
            filter: bannerFilter(shrinkOffset),
          ),
        ),
        _menuBar(shrinkOffset),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color bannerFilter(double shrinkOffset) {
    if (shrinkOffset < 499) {
      return Colors.black.withOpacity(
          0.39 - (shrinkOffset / maxExtent / 1.5) < 0
              ? 0.0
              : 0.39 - (shrinkOffset / maxExtent / 1.5));
    } else {
      return Colors.white.withOpacity(0.0 + (shrinkOffset / maxExtent));
    }
  }

  Color menuTextColor(double shrinkOffset) {
    if (shrinkOffset < 99) {
      return Colors.white.withOpacity(1 - (shrinkOffset / maxExtent));
    } else {
      return Colors.black.withOpacity(0.199 + (shrinkOffset / maxExtent) > 1
          ? 1
          : 0.199 + (shrinkOffset / maxExtent));
    }
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  Widget _menuBar(double shrinkOffset) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ScrollProgress(progress: scrollProvider.progress),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          height: 119,
          padding: const EdgeInsets.symmetric(
            horizontal: 70,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _Logo(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(
                  6,
                  (index) => _BarItem(
                    index: index,
                    pageIndex: pageIndex,
                    menuTextColor: menuTextColor(shrinkOffset),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
