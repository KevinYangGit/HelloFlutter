/*
单子布局组件的含义是其只有一个子组件，可以通过设置一些属性设置该子组件所在的位置信息等。

比较常用的单子布局组件有：Align、Center、Padding、Container。
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
      appBar: AppBar(
        title: Text("Align"),
      ),
      body: MyBody(),
    );
  }
}

/*
Container+BoxDecoration 圆角图片
*/

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                  "https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg")),
        ),
      ),
    );
  }
}
/*
Container+BoxDecoration

Container组件类似于其他Android中的View，iOS中的UIView。

如果你需要一个视图，有一个背景颜色、图像、有固定的尺寸、需要一个边框、圆角等效果，那么就可以使用Container组件。
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 200,
//       child: Icon(Icons.phone),
//       decoration: BoxDecoration(
//         color: Colors.lightGreen,
//         border: Border.all(
//           color: Colors.red,
//           width: 5.0,
//           style: BorderStyle.solid,
//         ),
//         // border: Border(
//         //   top: BorderSide(color: Colors.red, width: 5),
//         //   right: BorderSide(color: Colors.blue, width: 10),
//         // ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.yellow,
//             offset: Offset(5, 5),
//             blurRadius: 20,
//           ),
//         ],
//         gradient: LinearGradient(
//           colors: [
//             Colors.blue,
//             Colors.red,
//           ],
//         ),
//       ),
//     );
//   }
// }

// /*
// Padding
// Padding通常用于设置子Widget到父Widget的边距
// */

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.lightGreen,
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Container(
//           decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//           child: Text(
//               "风急天高猿啸哀，渚清沙白鸟飞回。无边落木萧萧下，不尽长江滚滚来。万里悲秋常作客，百年多病独登台。艰难苦恨繁霜鬓，潦倒新停浊酒杯。"),
//         ),
//       ),
//     );
//   }
// }

/*
Center

事实上Center组件继承自Align，只是将alignment设置为Alignment.center。
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       child: Center(
//         widthFactor: 2,
//         heightFactor: 1,
//         child: Container(
//           decoration: BoxDecoration(color: Colors.red),
//           child: Icon(
//             Icons.email,
//             size: 60,
//           ),
//         ),
//       ),
//     );
//   }
// }


/*
Align

widthFactor和heightFactor作用：

因为子组件在父组件中的对齐方式必须有一个前提，就是父组件得知道自己的范围（宽度和高度）；
如果widthFactor和heightFactor不设置，那么默认Align会尽可能的大（尽可能占据自己所在的父组件）；
我们也可以对他们进行设置，比如widthFactor设置为3，那么相对于Align的宽度是子组件跨度的3倍；
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.green,
//       child: Align(
//         alignment: Alignment.topLeft,
//         widthFactor: 3,
//         heightFactor: 3,
//         child: Container(
//           decoration: BoxDecoration(border: Border.all(color: Colors.red)),
//           child: Icon(
//             Icons.people_alt,
//             size: 40,
//           ),
//         ),
//       ),
//     );
//   }
// }
