import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(myapp());

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GridView",
      theme: ThemeData(primarySwatch: Colors.orange, splashColor: Colors.red),
      home: KYHomePage(),
    );
  }
}

/*
* 测试二：maxCrossAxisExtent
* */
// class KYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       // 该委托将根据以下条件为图块选择尽可能大的横轴范围：范围
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           // 交叉轴的item宽度（首先按照 maxCrossAxisExtent 创建对应宽度的 item，如果超过屏幕宽度，则自动缩小。
//           // 如：maxCrossAxisExtent = 300，屏幕宽度 = 450，创建两个 300 宽的 item 显示不下，则创建两个 225 的item。）
//           maxCrossAxisExtent: 300,
//           // 交叉轴间距
//           crossAxisSpacing: 8,
//           // 主轴间距
//           mainAxisSpacing: 8,
//           // 宽高比
//           childAspectRatio: 1.8),
//       // item 列表，一次行创建
//       children: List.generate(100, (index) {
//         return Container(
//           color: Color.fromARGB(255, Random().nextInt(256),
//               Random().nextInt(256), Random().nextInt(256)),
//         );
//       }),
//     );
//   }
// }

/*
* 测试一：创建 GridView
* */
// class KYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           // 交叉轴数量
//           crossAxisCount: 3,
//           // 宽高比
//           childAspectRatio: .8,
//           // 交叉轴间距
//           crossAxisSpacing: 8,
//           // 主轴间距
//           mainAxisSpacing: 8
//         ),
//       // item 数组（一次性创建 100 个子 item）
//       children: List.generate(100, (index) {
//         // 创建 item
//         return Container(
//           // 设置随机色
//           color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
//         );
//       }),
//     );
//   }
// }

/*
* 测试三：实时创建item
* */
// class KYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("列表测试"),
//       ),
//       body: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             // 交叉轴数量
//             crossAxisCount: 2,
//             // 主轴间距
//             mainAxisSpacing: 8,
//             // 交叉轴间距
//             crossAxisSpacing: 8
//           ),
//           // item 构建方法，实时创建
//           itemBuilder: (BuildContext ctx, int index) {
//             // item
//             return Container(
//               color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
//             );
//           }
//       ),
//     );
//   }
// }

/*
* 测试四：添加边距
* */
class KYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("列表测试"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // 交叉轴数量
                  crossAxisCount: 2,
                  // 主轴间距
                  mainAxisSpacing: 8,
                  // 交叉轴间距
                  crossAxisSpacing: 8),
              // item 构建方法，实时创建
              itemBuilder: (BuildContext ctx, int index) {
                // item
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                );
              }),
        ));
  }
}
