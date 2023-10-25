import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Flutter')
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: true, // 默认选中
                  onChanged: (value) { // 点击选择器
                    print(value);
                  }),
              Text(
                '同意协议', // 文字内容
                style: TextStyle(fontSize: 28), // 字体样式
              ),
            ],
          ),
        ),
      ),
    ),
  );
}