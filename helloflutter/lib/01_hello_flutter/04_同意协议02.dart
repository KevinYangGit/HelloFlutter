import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyApp build');
    return MaterialApp(
        home: KYHome()
    );
  }
}

class KYHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('KYHome build');
    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter')
      ),
      body: KYBody(),
    );
  }
}

class KYBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KYState();
  }
}

class KYState extends State<KYBody> {
  // 记录选择状态，默认选中
  var flag = true;

  @override
  Widget build(BuildContext context) {
    print('KYState build');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: flag,
              onChanged: (bool? value) {
                // 更新UI（1.调用闭包；2.刷新UI（即调用 KYState 的 build 方法）；）
                setState(() {
                  flag = value!; // 更新UI前，先更新选中状态
                });
              }),
          Text(
            '同意协议',
            style: TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
