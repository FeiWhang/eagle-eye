import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/desktop/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';

List<Widget> socialMedia() {
  return <Widget>[
    GestureDetector(
      onTap: () => launchURL(URL.facebook),
      child: Image.asset(
        Asset.facebook,
        fit: BoxFit.cover,
        scale: 11.99,
      ),
    ).showCursorOnHover.moveUpOnHover,
    Padding(
      padding: EdgeInsets.only(left: 19),
      child: GestureDetector(
        onTap: () => launchURL(URL.youtube),
        child: Image.asset(
          Asset.youtube,
          scale: 11.99,
        ),
      ).showCursorOnHover.moveUpOnHover,
    ),
    Padding(
      padding: EdgeInsets.only(left: 19),
      child: GestureDetector(
        onTap: () => launchURL(URL.line),
        child: Image.asset(
          Asset.line,
          scale: 11.99,
        ),
      ).showCursorOnHover.moveUpOnHover,
    ),
  ];
}
