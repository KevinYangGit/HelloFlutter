/*
1、runApp 是Flutter内部提供的一个函数，当我们启动一个Flutter应用程序时就是从调用这个函数开始的

2、material 是Google公司推行的一套设计风格，或者叫设计语言、设计规范等；里面有非常多的设计规范，比如颜色、文字的排版、响应动画与过度、填充等等；在Flutter中高度集成了Material风格的Widget；
目前我们使用了其中两个属性；
title：这个是定义在Android系统中打开多任务切换窗口时显示的标题；（暂时可以不写）
home：是该应用启动时显示的页面，我们传入了一个Scaffold；

3、Scaffold 翻译过来是脚手架，脚手架的作用就是搭建页面的基本结构；
Scaffold 也有一些属性，比如 appBar和body；
appBar是用于设计导航栏的，我们传入了一个title属性；
body是页面的内容部分，我们传入了之前已经创建好的Center中包裹的一个Text的Widget；

4、Center 实现居中布局

5、Text 完成文字的显示；
*/

import 'package:flutter/material.dart';

main() {
  runApp(
      MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Flutter")
            ),
            body: Center(
              child: Text(
                'Hello world!',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.blue),
              ),
            )
        ),
      )
  );
}

/*
* 快捷键：
* 1. Opt + Command + L 代码对齐
* */