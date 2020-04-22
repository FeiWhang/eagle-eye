import 'package:eagle_eye/layouts/desktop/widgets/banners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../constants.dart';

class MoveUpOnHover extends StatefulWidget {
  final Widget child;
  MoveUpOnHover({Key key, this.child}) : super(key: key);

  @override
  _MoveUpOnHoverState createState() => _MoveUpOnHoverState();
}

class _MoveUpOnHoverState extends State<MoveUpOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -1.99, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 199),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}

class ShowButtunOnHover extends StatefulWidget {
  final Widget child;
  ShowButtunOnHover({Key key, this.child}) : super(key: key);

  @override
  _ShowButtunOnHoverState createState() => _ShowButtunOnHoverState();
}

class _ShowButtunOnHoverState extends State<ShowButtunOnHover> {
  bool _hovering = false;
  final DesktopBanner desktopBanner = DesktopBanner(aspectRatio: 21 / 9);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 99),
        child: _hovering
            ? Swiper(
                itemCount: Asset.banners.length,
                itemBuilder: (context, index) {
                  return desktopBanner.eachBanner(context, index);
                },
                control: SwiperControl(
                  iconNext: Icons.chevron_right,
                  iconPrevious: Icons.chevron_left,
                  size: 55,
                  color: Colors.grey[700],
                ),
                physics: NeverScrollableScrollPhysics(),
                autoplay: true,
                viewportFraction: 1,
              )
            : widget.child,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
