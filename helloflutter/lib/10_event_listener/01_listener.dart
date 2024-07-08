import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: KYHomePage());
  }
}

class KYHomePage extends StatefulWidget {
  @override
  State createState() => _KYHomePageState();
}

class _KYHomePageState extends State<KYHomePage> {
  var postion = Offset(100, 300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pointer Listener"),
      ),
      // 添加监听事件，就是用 Listener 包裹住子widget
      body: Listener(
        // 按下
        onPointerDown: (event) {
          print(
              '手指按下: $event, position: ${event.position}, localPosition: ${event.localPosition}');
          countPosition(event.position);
        },
        onPointerUp: (event) {
          print(
              '手指抬起: $event, position: ${event.position}, localPosition: ${event.localPosition}');
        },
        onPointerCancel: (event) {
          print(
              '手势取消: $event, position: ${event.position}, localPosition: ${event.localPosition}');
        },
        onPointerMove: (event) {
          print(
              '指针移动: $event, position: ${event.position}, localPosition: ${event.localPosition}');
          countPosition(event.position);
        },
        // 添加了监听事件的 widget
        child: Container(
          margin: EdgeInsets.only(left: postion.dx, top: postion.dy),
          width: 200,
          height: 200,
          color: Colors.yellow,
        ),
      ),
    );
  }

  void countPosition(Offset position) {
    return setState(() {
      double x = position.dx - 100;
      double y = position.dy - 200;
      x = x > 0 ? x : 0;
      y = y > 0 ? y : 0;
      postion = Offset(x, y);
    });
  }
}
