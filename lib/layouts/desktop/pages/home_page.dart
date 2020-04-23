import 'package:eagle_eye/constants.dart';
import 'package:eagle_eye/layouts/desktop/providers/scale_provider.dart';
import 'package:eagle_eye/layouts/desktop/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:eagle_eye/layouts/desktop/extensions/hover_extension.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[GetStartedBar()] +
            List<Widget>.generate(3, (index) => ProductShowcase(index: index)) +
            <Widget>[RecommendedProduct()],
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
      color: Colors.white,
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
  Widget _eachProduct(BuildContext context, int index) {
    return ChangeNotifierProvider<ScaleProvider>(
      create: (BuildContext context) => ScaleProvider(),
      child: Consumer<ScaleProvider>(
        builder: (BuildContext context, ScaleProvider value, Widget child) =>
            MouseRegion(
          onEnter: (event) => value.setHovering(true),
          onExit: (event) => value.setHovering(false),
          child: Stack(
            children: [
              AnimatedContainer(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Asset.homeRecommended[index],
                    ),
                    scale: value.scale,
                  ),
                ),
                duration: Duration(milliseconds: 999),
                curve: Curves.easeOutCirc,
                // child: ,
              ),
              value.hovering
                  ? AnimatedContainer(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        color: AppColor.darkFilter,
                      ),
                      duration: Duration(milliseconds: 199),
                      curve: Curves.easeOutCirc,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              Typo.recommendedProducts[index],
                              style: TypoStyle.whiteTitle,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.all(9),
                              margin: EdgeInsets.only(top: 19),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                gradient: AppColor.menuGradient,
                              ),
                              child: Text(Typo.recommendedProductsCode[index],
                                  style: TypoStyle.whiteSubtitle),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    ).showCursorOnHover;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 39, bottom: 39),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            Typo.recommended,
            style: TypoStyle.blackTitle,
            textAlign: TextAlign.center,
          ),
          Row(
            children: List.generate(5, (index) => _eachProduct(context, index)),
          ),
        ],
      ),
    );
  }
}
