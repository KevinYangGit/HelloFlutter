/*
在Flutter开发中，我们可以继承自StatelessWidget或者StatefulWidget来创建自己的Widget类；
StatelessWidget： 没有状态改变的Widget，通常这种Widget仅仅是做一些展示工作而已；
StatefulWidget： 需要保存状态，并且可能出现状态改变的Widget；

1、创建一个StatelessWidget的格式：
1>让自己创建的Widget继承自StatelessWidget；
2>StatelessWidget包含一个必须重写的方法：build方法；

2、build方法什么情况下被执行呢？：

1>当我们的StatelessWidget第一次被插入到Widget树中时（也就是第一次被创建时）；
2>当我们的父Widget（parent widget）发生改变时，子Widget会被重新构建；
3>如果我们的Widget依赖InheritedWidget的一些数据，InheritedWidget数据发生改变时；

3、使用 class 定义自己的 widget

4、=>
如果函数只有一行代码，可以使用 => 取代 {}，作为简化版的函数实现
*/

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