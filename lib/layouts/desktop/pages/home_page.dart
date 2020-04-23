import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/desktop/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
              // DesktopBanner(aspectRatio: 21 / 9).showButtunOnHover,
              GetStartedBar(),
            ] +
            List<Widget>.generate(3, (index) => ProductShowcase(index: index)) +
            <Widget>[],
      ),
    );
  }
}

class GetStartedBar extends StatelessWidget {
  const GetStartedBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.menuGradient,
      ),
      padding: EdgeInsets.fromLTRB(39, 19, 39, 19),
      alignment: Alignment.center,
      child: SizedBox(
        width: 999,
        child: ListTile(
          title: Text(Typo.getStartedQuoted, style: TypoStyle.whiteTitle),
          subtitle:
              Text(Typo.getStartedCaption, style: TypoStyle.whiteSubtitle),
          trailing: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            onPressed: () => launchURL(URL.facebook),
            child: Text(Typo.getStarted),
            color: Colors.grey[100],
            hoverElevation: 6.9,
            hoverColor: Colors.white,
            colorBrightness: Brightness.light,
            animationDuration: Duration(milliseconds: 99),
          ).showCursorOnHover.moveUpOnHover,
        ),
      ),
    );
  }
}

class ProductShowcase extends StatelessWidget {
  final int index;

  const ProductShowcase({Key key, this.index}) : super(key: key);

  Widget _picture() {
    return Padding(
      padding: EdgeInsets.only(left: 29, right: 29),
      child: Image.asset(
        Asset.homeShowcases[index],
        // width: 299,
        // height: 299,
        fit: BoxFit.cover,
        // scale: 0.1,
      ),
    );
  }

  Widget _title(int index) {
    return Container(
      padding: EdgeInsets.only(top: 69, bottom: 29),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(9.9, 6.9, 9.9, 6.9),
            margin: EdgeInsets.only(right: 19),
            decoration: BoxDecoration(
              gradient: AppColor.menuGradient,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Text(
              Typo.homeShowcasesType[index],
              style: TypoStyle.whiteTitle,
            ),
          ),
          Text(
            Typo.homeShowcasesTitle[index],
            style: TypoStyle.blackTitle,
          ),
          Spacer(),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            onPressed: () {}, // TODO: Navigate to Product page
            child: Text(
              Typo.readMore + ' >',
              style: TypoStyle.readMore,
            ),
          ).showCursorOnHover.moveUpOnHover,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPictureLead = true;
    if (index % 2 != 0) isPictureLead = false;

    return Container(
      alignment: Alignment.center,
      height: 399,
      child: Container(
        width: 1199,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.99, color: Colors.grey[200]),
          ),
        ),
        child: GFListTile(
          avatar: isPictureLead == true ? _picture() : null,
          title: _title(index),
          subTitle: Container(
            width: 599,
            child: Text(
              Typo.homeShowcasesSubtitle[index],
              style: TypoStyle.blackSubtitle,
            ),
          ),
          icon: isPictureLead == false ? _picture() : null,
          padding: EdgeInsets.all(39),
        ),
      ),
    );
  }
}

class RecommendedProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
