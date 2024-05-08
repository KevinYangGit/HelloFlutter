

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider basic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KYTextLessWidget(),
            KYTextFulWidget()
          ],
        ),
      ),
    );
  }
}

class KYTextLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class KYTextFulWidget extends StatefulWidget {
  State createState() => _KYTextFulWidgetState();
}

class _KYTextFulWidgetState extends State<KYTextFulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('当前计数：'),
    );
  }
}




