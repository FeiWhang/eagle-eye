import 'package:eagle_eye/layouts/desktop/widgets/banners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:vector_math/vector_math_64.dart' show Vector3;

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
      child: Container(
        height: 699,
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

class DarkenOnHover extends StatefulWidget {
  final Widget child;
  DarkenOnHover({Key key, this.child}) : super(key: key);

  @override
  _DarkenOnHoverState createState() => _DarkenOnHoverState();
}

class _DarkenOnHoverState extends State<DarkenOnHover>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;

  AnimationController _hoverAnimationController;
  Animation<double> _hoverAnimation;
  @override
  void initState() {
    super.initState();
    _hoverAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2999));

    _hoverAnimation = Tween<double>(
      begin: 1,
      end: 1.09,
    ).animate(
      CurvedAnimation(
        parent: _hoverAnimationController,
        curve: Curves.easeOutCirc,
      ),
    );
    _hoverAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5,
      child: MouseRegion(
        onEnter: (event) => _mouseEnter(true),
        onExit: (event) => _mouseEnter(false),
        child: _hovering
            ? ScaleTransition(scale: _hoverAnimation, child: widget.child)
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

class ZoomOnHover extends StatefulWidget {
  final Widget child;
  final int index;
  ZoomOnHover({Key key, this.child, this.index}) : super(key: key);

  @override
  _ZoomOnHoverState createState() => _ZoomOnHoverState();
}

class _ZoomOnHoverState extends State<ZoomOnHover>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  final double hoverScale = 0.88;
  final double nonHoverScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.55),
          border: Border.all(color: Colors.black),
          image: DecorationImage(
            image: AssetImage(
              Asset.homeRecommended[widget.index],
            ),
            scale: _hovering ? hoverScale : nonHoverScale,
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
