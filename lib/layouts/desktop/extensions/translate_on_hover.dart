import 'package:flutter/material.dart';

class TranslareOnHover extends StatefulWidget {
  final Widget child;
  TranslareOnHover({Key key, this.child}) : super(key: key);

  @override
  _TranslareOnHoverState createState() => _TranslareOnHoverState();
}

class _TranslareOnHoverState extends State<TranslareOnHover> {
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
