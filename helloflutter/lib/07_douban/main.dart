

import 'package:flutter/material.dart';
import 'package:helloflutter/07_douban/main/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 在任务管理窗口中所显示的应用名字
      title: 'DouBan',
      home: KYMainPage(),
    );
  }
}