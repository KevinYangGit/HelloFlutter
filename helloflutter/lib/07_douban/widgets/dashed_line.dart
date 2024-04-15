import 'package:flutter/material.dart';

class KYDashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    });
    // 使用const关键字来修饰构造函数可以提高性能,因为是不会发生变化的
    return const SizedBox(
      width: 10,
      height: 10,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
      ),
    );
  }
}