/*
我们考虑一个这样的布局：一个滑动的视图中包括一个标题视图（HeaderView），一个列表视图（ListView），一个网格视图（GridView）。
我们怎么可以让它们做到统一的滑动效果呢？使用前面的滚动是很难做到的。
Flutter中有一个可以完成这样滚动效果的Widget：CustomScrollView，可以统一管理多个滚动视图。
在CustomScrollView中，每一个独立的，可滚动的Widget被称之为Sliver。
补充：Sliver可以翻译成裂片、薄片，你可以将每一个独立的滚动视图当做一个小裂片。

因为我们需要把很多的Sliver放在一个CustomScrollView中，所以CustomScrollView有一个slivers属性，里面让我们放对应的一些Sliver：

SliverList：类似于我们之前使用过的ListView；
SliverFixedExtentList：类似于SliverList，只是可以设置滚动的高度；
SliverGrid：类似于我们之前使用过的GridView；
SliverPadding：设置Sliver的内边距，因为可能要单独给Sliver设置内边距；
SliverAppBar：添加一个AppBar，通常用来作为CustomScrollView的HeaderView；
SliverSafeArea：设置内容显示在安全区域（比如不让齐刘海挡住我们的内容）

jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。
*/

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
//             // item：创建一个委托，使用给定的构建器回调为条子提供子级。
//             delegate: SliverChildBuilderDelegate((BuildContext ctx, int int) {
//               return Container(
//                   color: Color.fromARGB(255, Random().nextInt(256),
//                       Random().nextInt(256), Random().nextInt(256)));
//             },
//                 // item数量
//                 childCount: 100),
//             // 布局：创建一个委托，用于在横轴上使用固定数量的图块进行网格布局。
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 1.5))
//       ],
//     );
//   }
// }
