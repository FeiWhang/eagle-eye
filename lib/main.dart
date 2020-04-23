import 'package:eagle_eye/layouts/desktop/routing/navigation_service.dart';
import 'package:eagle_eye/layouts/desktop/routing/route_names.dart';
import 'package:eagle_eye/layouts/desktop/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layouts/desktop/pages/desktop.dart';
import 'layouts/desktop/routing/locator.dart';

void main() {
  setupLocator();
  runApp(EagleEye());
}

class EagleEye extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eagle Eye - Thailand',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'CeraPro'),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}

class Base extends StatelessWidget {
  final int pageIndex;

  const Base({Key key, this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 1250,
        watch: 300,
      ),
      mobile: Container(color: Colors.blue),
      tablet: Container(color: Colors.yellow),
      desktop: Desktop(
        pageIndex: pageIndex,
      ),
    );
  }
}
