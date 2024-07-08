
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IgnoreGesture'),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // 使用 GestureDetector 添加手势，点击红色区域打印 outter
            GestureDetector(
              onTapDown: (details) {
                print('outter');
              },
              child: Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
            ),
            /*
            IgnorePointer 可以忽略掉某些手势，可通过 bool ignoring 属性控制是否忽略，默认 true
            未添加 IgnorePointer 时
            点击黄色区域只打印 ‘inner’，不会触发红色区域的点击事件

            添加 IgnorePointer 后
            点击黄色区域打印 ‘outter’，不会触发黄色区域的点击事件，会触发红色区域的点击事件
            */
            IgnorePointer(
              child: GestureDetector(
                onTapDown: (details) {
                  print('innter');
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}