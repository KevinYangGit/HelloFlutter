import "package:flutter/material.dart";
import 'dart:math';

void main() => runApp(myapp());

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 相当于 Tab
    return MaterialApp(
      home: KYHomePage(),
    );
  }
}

class KYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // --- 相当于 navigation
    return Scaffold(
      // --- 创建自定义滚动视图
      body: CustomScrollView(
        // --- 创建滚动视图包含的元素（）
        slivers: <Widget>[
          // --- 1、自定义滚动视图的 Header
          SliverAppBar(
            // --- Header 的高度
            expandedHeight: 300,
            // --- Header 在滑动到顶部时悬停，显示为导航栏
            pinned: true,
            // --- Header 的样式（标题，背景图）
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Custom ScrollView"),
              background: Image.asset(
                "assets/images/01.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // --- 2、自定义 GrideView（同 iOS 的 UICollectionView）
          SliverGrid(
            // --- 实时创建子 item
              delegate: SliverChildBuilderDelegate((BuildContext ctx, int int) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                );
              },
                  // --- 子元素数量
                  childCount: 4),
              // --- 设置列表布局：横轴的数量，间距和主轴的间距
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8)),
          // --- 3、自定义 ListView（同 iOS 的 UITableView）
          SliverList(
            // --- 实时创建子 item
              delegate: SliverChildBuilderDelegate((BuildContext ctx, int index) {
                return ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人$index"),
                );
              },
                  // --- 子元素数量
                  childCount: 100))
        ],
      ),
    );
  }
}

/*
* 测试二：SliverSafeArea 和 SliverPadding
* */
// class KYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: <Widget>[
//         // 列表的安全区域
//         SliverSafeArea(
//             // 列表边距
//             sliver: SliverPadding(
//               padding: EdgeInsets.all(8),
//               sliver: SliverGrid(
//               // 创建一个委托，使用给定的构建器回调为条子提供子级。
//               delegate: SliverChildBuilderDelegate((BuildContext ctx, int int) {
//                 return Container(
//                     color: Color.fromARGB(255, Random().nextInt(256),
//                         Random().nextInt(256), Random().nextInt(256)));
//               },
//                   // item数量
//                   childCount: 100),
//               // 创建一个委托，用于在横轴上使用固定数量的图块进行网格布局。
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   childAspectRatio: 1.5)),
//         ))
//       ],
//     );
//   }
// }

/*
* 测试一：使用 SliverChildBuilderDelegate 和 SliverGridDelegateWithFixedCrossAxisCount 自定义 GridView
* */

// class KYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: <Widget>[
//         SliverGrid(
//             // 创建一个委托，使用给定的构建器回调为条子提供子级。
//             delegate: SliverChildBuilderDelegate((BuildContext ctx, int int) {
//               return Container(
//                   color: Color.fromARGB(255, Random().nextInt(256),
//                       Random().nextInt(256), Random().nextInt(256)));
//             },
//                 // item数量
//                 childCount: 100),
//             // 创建一个委托，用于在横轴上使用固定数量的图块进行网格布局。
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 1.5))
//       ],
//     );
//   }
// }
