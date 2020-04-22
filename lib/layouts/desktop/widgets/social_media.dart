import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/desktop/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';

List<Widget> socialMedia() {
  return <Widget>[
    Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => launchURL(URL.facebook),
        heroTag: null,
        mini: true,
        shape: new CircleBorder(),
        child: Image.asset(
          Asset.facebook,
        ),
      ),
    ).showCursorOnHover.moveUpOnHover,
    Container(
      padding: EdgeInsets.only(left: 9.9),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => launchURL(URL.youtube),
        heroTag: null,
        mini: true,
        shape: new CircleBorder(),
        child: Image.asset(
          Asset.youtube,
        ),
      ),
    ).showCursorOnHover.moveUpOnHover,
    Container(
      padding: EdgeInsets.only(left: 9.9),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => launchURL(URL.line),
        heroTag: null,
        mini: true,
        shape: new CircleBorder(),
        child: Image.asset(
          Asset.line,
        ),
      ),
    ).showCursorOnHover.moveUpOnHover,
  ];
}
