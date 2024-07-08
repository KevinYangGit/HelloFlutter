/*
几个比较常见的属性：

一些属性比较简单：keyboardType键盘的类型，style设置样式，textAlign文本对齐方式，maxLength最大显示行数等等；

decoration：用于设置输入框相关的样式：
  icon：设置左边显示的图标
  labelText：在输入框上面显示一个提示的文本
  hintText：显示提示的占位文字
  border：输入框的边框，默认底部有一个边框，可以通过InputBorder.none删除掉
  filled：是否填充输入框，默认为false
  fillColor：输入框填充的颜色

controller：
onChanged：监听输入框内容的改变，传入一个回调函数
onSubmitted：点击键盘中右下角的down时，会回调的一个函数
*/

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextField"),
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(),
        ],
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // 1.创建监听器
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 2.设置默认值
    _textEditingController.text = "Hello World";
    // 3.监听文本框
    _textEditingController.addListener(() {
      print(
          "TextEditingController.addListener: ${_textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      // 4.设置监听器
      controller: _textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.password),
        labelText: "密码",
        hintText: "请输入密码",
        // border: InputBorder.none, // 边框
        filled: true,
        fillColor: Colors.yellow,
      ),
      onChanged: (value) {
        print(value);
      },
      onSubmitted: (value) {
        print(value);
      },
    );
  }
}

// class _MyTextFieldState extends State<MyTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       // 样式
//       decoration: InputDecoration(
//         icon: Icon(Icons.phone), // 图标
//         labelText: "手机号", // 标签
//         hintText: "请输入手机号", // 输入框提示文字
//         border: InputBorder.none, // 边框
//         filled: true, // 是否填充
//         fillColor: Colors.yellow, // 填充颜色
//       ),
//       // 监听-输入事件
//       onChanged: (value) {
//         print("onChange: $value");
//       },
//       // 监听-提交事件（回车键）
//       onSubmitted: (value) {
//         print("onSubmitted: $value");
//       },
//       cursorWidth: 1, // 光标宽度
//       cursorColor: Colors.red, // 光标颜色
//     );
//   }
// }
