import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
