/*
在开发中，我们经常需要将多个Widget放在一起进行布局，比如水平方向、垂直方向排列，甚至有时候需要他们进行层叠，比如图片上面放一段文字等；
这个时候我们需要使用多子布局组件（Multi-child layout widgets）。
比较常用的多子布局组件是Row、Column、Stack，我们来学习一下他们的使用。

Row组件和Column组件都继承自Flex组件。
Flex组件和Row、Column属性主要的区别就是多一个direction。
当direction的值为Axis.horizontal的时候，则是Row。
当direction的值为Axis.vertical的时候，则是Column。

因为Row是一行排布，Column是一列排布，那么它们都存在两个方向，并且两个Widget排列的方向应该是对立的。
它们之中都有主轴（MainAxis）和交叉轴（CrossAxis）的概念

Row 水平布局，水平方向是主轴，垂直方向是交叉轴
Column 垂直布局，垂直方向是主轴，水平方向是交叉轴
*/

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row")),
      body: MyBody(),
    );
  }
}

/*
Stack

Stack会经常和Positioned一起来使用，Positioned可以决定组件在Stack中的位置，用于实现类似于Web中的绝对定位效果。
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: Colors.green,
//           width: 200,
//           height: 200,
//         ),
//         Positioned(
//           top: 20,
//           left: 20,
//           child: Icon(Icons.people_alt),
//         ),
//         Positioned(
//           bottom: 20,
//           right: 20,
//           child: Text("Kevin Young"),
//         ),
//       ],
//     );
//   }
// }

/*
Column
*/

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(color: Colors.red, width: 88, height: 88),
          ),
          Container(color: Colors.blue, width: 66, height: 66),
          Container(color: Colors.green, width: 55, height: 55),
          Expanded(
            child: Container(color: Colors.yellow, width: 44, height: 44),
          ),
        ],
      ),
    );
  }
}

/*
Row 

Expanded：flex属性，弹性系数，Row会根据两个Expanded的弹性系数来决定它们占据剩下空间的比例
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Expanded(
//             child: Container(color: Colors.red, width: 88, height: 88),
//           ),
//           Container(color: Colors.blue, width: 66, height: 66),
//           Container(color: Colors.green, width: 55, height: 55),
//           Expanded(
//             child: Container(color: Colors.yellow, width: 44, height: 44),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
Row

Row组件用于将所有的子Widget排成一行
mainAxisAlignment、crossAxisAlignment、mainAxisSize
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(color: Colors.red, width: 80, height: 88),
//           Container(color: Colors.blue, width: 66, height: 66),
//           Container(color: Colors.lightGreenAccent, width: 55, height: 55),
//           Container(color: Colors.yellow, width: 44, height: 44),
//         ],
//       ),
//     );
//   }
// }
