import 'package:flutter/material.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> socialMedia() {
  return <Widget>[
    Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => _launchURL("https://www.facebook.com/eagleeyeTH/"),
        heroTag: null,
        mini: true,
        shape: new CircleBorder(),
        child: Image.asset(
          "assets/home/social/facebook.png",
        ),
      ),
    ).showCursorOnHover.moveUpOnHover,
    Container(
      padding: EdgeInsets.only(left: 9.9),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => _launchURL(
            "https://www.youtube.com/channel/UC2AmuaHgNyGCuwNSiB08bzw/videos"),
        heroTag: null,
        mini: true,
        shape: new CircleBorder(),
        child: Image.asset(
          "assets/home/social/youtube.png",
        ),
      ),
    ).showCursorOnHover.moveUpOnHover,
    Container(
      padding: EdgeInsets.only(left: 9.9),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => _launchURL("https://line.me/R/ti/p/%40eagleeye"),
        heroTag: null,
        mini: true,
        shape: new CircleBorder(),
        child: Image.asset(
          "assets/home/social/line.png",
        ),
      ),
    ).showCursorOnHover.moveUpOnHover,
  ];
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
