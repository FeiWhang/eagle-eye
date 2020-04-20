import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SupportBody(),
    );
  }
}

class SupportBody extends StatelessWidget {
  const SupportBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Support Body"),
      ),
    );
  }
}
