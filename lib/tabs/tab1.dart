import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(1.0),
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: const [Text("tab 1 precent")],
      ),
    );
  }
}
