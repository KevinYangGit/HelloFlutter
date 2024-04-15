import 'package:flutter/material.dart';

void main() => runApp(myapp());

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "监听滚动",
      home: KYHomePage(),
    );
  }
}

class KYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: Icon(Icons.people),
          title: Text("联系人$index"),
        );
      })
    );
  }
}