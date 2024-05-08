
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
  // 通过 GlobalKey 获取子 widget 的 state，实现父类持有子类
  final GlobalKey<_HomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('globalkey的使用'),
      ),
      body: HomeContent(key: homeKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 获取 state 的 message 属性
          print(homeKey.currentState?.message);
          // 获取 state 的 widget 的 name 属性
          print(homeKey.currentState?.widget.name);
          // 调用 state 的 test() 方法
          homeKey.currentState?.test();
        }),
    );
  }
}

class HomeContent extends StatefulWidget {
  final name = 'globalkey测试';
  HomeContent({Key? key}) : super(key: key);
  State createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final message = '123';

  void test() {
    print('test');
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}