import 'package:eagle_eye/layouts/desktop/pages/error_page.dart';
import 'package:eagle_eye/layouts/desktop/routing/route_names.dart';
import 'package:eagle_eye/main.dart';
import 'package:flutter/material.dart';

Route generateRoute(RouteSettings settings) {
  // var routingData = settings.name.getRoutingData;

  switch (settings.name) {
    case HomeRoute:
      return _pageRoute(Base(pageIndex: 0), settings);
      break;
    case AboutRoute:
      return _pageRoute(Base(pageIndex: 1), settings);
      break;
    case ProductRoute:
      return _pageRoute(Base(pageIndex: 2), settings);
      break;
    case SupportRoute:
      return _pageRoute(Base(pageIndex: 3), settings);
      break;
    case EventRoute:
      return _pageRoute(Base(pageIndex: 4), settings);
      break;
    case ContactRoute:
      return _pageRoute(Base(pageIndex: 5), settings);
      break;

    default:
      return _pageRoute(ErrorPage(), settings);
  }
}

PageRoute _pageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
