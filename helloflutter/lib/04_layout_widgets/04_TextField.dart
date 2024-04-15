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
