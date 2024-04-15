import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KYHome(),
    );
  }
}

class KYHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flutter")), body: KYBody());
  }
}

class KYBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello world!',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 36, color: Colors.blue),
      ),
    );
  }
}
