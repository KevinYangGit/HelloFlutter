
import 'package:flutter/material.dart';

// 第一步：创建自己的ChangeNotifier
// 真正数据（状态）存放的地方
class KYCounterPrivoder extends ChangeNotifier {
  int _counter = 88;

  int get counter => _counter;

  // 1.1 在setter中我们监听到_counter的改变
  set counter(int value) {
    _counter = value;
    // 1.2 调用notifyListeners方法，通知所有的Consumer进行更新
    notifyListeners();
  }
}