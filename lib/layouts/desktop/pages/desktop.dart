import 'package:eagle_eye/layouts/desktop/widgets/appbar.dart';
import 'package:eagle_eye/layouts/desktop/widgets/social_media.dart';
import 'package:flutter/material.dart';

class Desktop extends StatelessWidget {
  final Widget child;
  final int pageIndex;
  const Desktop({Key key, @required this.child, this.pageIndex})
      : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: DesktopBar(pageIndex: pageIndex)),
      body: child,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: socialMedia(),
      ),
    );
  }
}
