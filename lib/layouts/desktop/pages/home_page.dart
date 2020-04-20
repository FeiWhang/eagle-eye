import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/shared/banners.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final int index = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ScrollBarProvider(),
      child: Consumer<ScrollBarProvider>(
        builder: (BuildContext context, ScrollBarProvider value, Widget child) {
          return Scaffold(
            appBar: _scrollBar(context, value),
            backgroundColor: Colors.white,
            body: HomeBody(
              scrollBarProvider: value,
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final ScrollBarProvider scrollBarProvider;
  final ScrollController _scrollController = ScrollController();

  HomeBody({Key key, this.scrollBarProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification ||
            notification is ScrollUpdateNotification ||
            notification is ScrollEndNotification) {
          _updateScroll(notification.metrics.pixels);
        }
        return true;
      },
      child: ListView.builder(
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "Item = ${index + 1}",
                textAlign: TextAlign.center,
              ),
            );
          }),
    );
  }

  void _updateScroll(double pixel) {
    if (scrollBarProvider.maxPixel == null) {
      scrollBarProvider.setMaxPixel(_scrollController.position.maxScrollExtent);
    }
    scrollBarProvider.updatePixels(pixel); // update pixel
  }
}

PreferredSize _scrollBar(
    BuildContext context, ScrollBarProvider scrollBarProvider) {
  return PreferredSize(
    preferredSize: Size.fromHeight(1.99),
    child: LinearProgressIndicator(
      value: scrollBarProvider.progress,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.accent1),
    ),
  );
}

class ScrollBarProvider extends ChangeNotifier {
  double get progress {
    try {
      return _currentPixels / _maxPixel;
    } catch (e) {
      return 0;
    }
  }

  double _maxPixel;
  double get maxPixel => _maxPixel;
  void setMaxPixel(double pixel) => _maxPixel = pixel;

  double _currentPixels = 0;
  void updatePixels(double pixel) {
    _currentPixels = pixel;
    notifyListeners();
  }
}
