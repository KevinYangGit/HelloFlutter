
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KYHomePage(),
    );
  }
}

class KYHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 添加手势
        child: GestureDetector(
          onTapDown: (details) {
            print('手指按下 details: $details, globalPosition: ${details.globalPosition}, localPosition: ${details.localPosition}');
          },
          onTapUp: (details) {
            print('手指抬起 details: $details, globalPosition: ${details.globalPosition}, localPosition: ${details.localPosition}');
          },
          onTapCancel: () {
            print('手势取消');
          },
          onTap: () {
            print('手势点击');
          },
          onDoubleTap: () {
            print('手指双击');
          },
          onLongPress: () {
            print('长按手势');
          },
          // 添加了手势的子widget
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}