import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: EventBody(),
    );
  }
}

class EventBody extends StatelessWidget {
  const EventBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Event Body"),
      ),
    );
  }
}
