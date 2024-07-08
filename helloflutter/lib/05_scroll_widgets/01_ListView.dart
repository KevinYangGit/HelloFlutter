/*
1、移动端数据量比较大时，我们都是通过列表来进行展示的，比如商品数据、聊天列表、通信录、朋友圈等。
在Android中，我们可以使用ListView或RecyclerView来实现，在iOS中，我们可以通过UITableView来实现。
在Flutter中，我们也有对应的列表Widget，就是ListView。

2、可以通过设置 scrollDirection 参数来控制视图的滚动方向。

3、通过构造函数中的children传入所有的子Widget有一个问题：默认会创建出所有的子Widget。
但是对于用户来说，一次性构建出所有的Widget并不会有什么差异，但是对于我们的程序来说会产生性能问题，而且会增加首屏的渲染时间。
我们可以ListView.build来构建子Widget，提供性能。

ListView.build适用于子Widget比较多的场景，该构造函数将创建子Widget交给了一个抽象的方法，交给ListView进行管理，ListView会在真正需要的时候去创建子Widget，而不是一开始就全部初始化好。

该方法有两个重要参数：
itemBuilder：列表项创建的方法。当列表滚动到对应位置的时候，ListView会自动调用该方法来创建对应的子Widget。类型是IndexedWidgetBuilder，是一个函数类型。
itemCount：表示列表项的数量，如果为空，则表示ListView为无限列表。

4、在开发中，我们经常见到一种列表，有一个图标或图片（Icon），有一个标题（Title），有一个子标题（Subtitle），还有尾部一个图标（Icon）。
这个时候，我们可以使用ListTile来实现：

5、ListView.separated可以生成列表项之间的分割器，它除了比ListView.builder多了一个separatorBuilder参数，该参数是一个分割器生成器。

6、如果我们希望监听什么时候开始滚动，什么时候结束滚动，这个时候我们可以通过NotificationListener。
NotificationListener是一个Widget，模板参数T是想监听的通知类型，如果省略，则所有类型通知都会被监听，如果指定特定类型，则只有该类型的通知会被监听。
NotificationListener需要一个onNotification回调函数，用于实现监听处理逻辑。
该回调可以返回一个布尔值，代表是否阻止该事件继续向上冒泡，如果为true时，则冒泡终止，事件停止向上传播，如果不返回或者返回值为false 时，则冒泡继续。

7、在Flutter中，Widget并不是最终渲染到屏幕上的元素（真正渲染的是RenderObject），因此通常这种监听事件以及相关的信息并不能直接从Widget中获取，而是必须通过对应的Widget的Controller来实现。
ListView、GridView的组件控制器是ScrollController，我们可以通过它来获取视图的滚动信息，并且可以调用里面的方法来更新视图的滚动位置。

8、jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。
ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件。

*/

import 'package:flutter/material.dart';
import 'package:helloflutter/01_hello_flutter/02_HelloWorld02.dart';

void main() => runApp(myapp());

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: KYHomePage(),
    );
  }
}

/*
* 测试四：1. 根据滚动通知，监听滚动的开始，结束和正在滚动；
* */
class KYHomePage extends StatefulWidget {
  // 因为需要保存一个标记，用来判断浮动按钮的显示或隐藏，
  // 所以需要让 KYHomePage 继承子 StatefulWidge，并创建一个 State
  _KYHomePageState createState() => _KYHomePageState();
}

class _KYHomePageState extends State<KYHomePage> {
  /*
  * 状态
  * */
  // 创建控制 ListView 滚动的管理类，显示时默认滚到 300 的位置
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  // 是否显示浮动按钮
  bool _isShowFloatingBtn = false;

  @override
  void initState() {
    super.initState();
    // 监听滚动
    _controller.addListener(() {
      // 更新UI
      setState(() {
        // 滚动距离大鱼 1000 时，显示浮动按钮
        _isShowFloatingBtn = _controller.offset >= 1000;
      });
    });
  }

  /*
  * UI
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      appBar: AppBar(
        title: Text("ListView"),
      ),
      // 列表
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          } else {
            print("正在滚动。。。总长：${notification.metrics.maxScrollExtent}，当前位置：${notification.metrics.pixels}");
          }
          return true;
        },
        child: ListView.builder(
          // 滚动管理器
          controller: _controller,
          // 共200条
          itemCount: 200,
          // 创建需要显示的 ListTItle
          itemBuilder: (BuildContext cxt, int index) {
            // 实时创建需要显示的 ListTitle
            return ListTile(
              // 最左侧显示头像 icon
              leading: Icon(Icons.people),
              // 标题部分显示文字
              title: Text("联系人$index"),
            );
          },
        ),
      ),
      // 浮动按钮，当 _isShowFloatingBtn == true 时创建，否则是 null
      floatingActionButton: _isShowFloatingBtn ? FloatingActionButton(
        // 向上箭头
        child: Icon(Icons.arrow_upward),
        // 点击事件
        onPressed: () {
          // 滚动到 0 处，动画时长 1s，动画方式 easeIn
          _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
      ): null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 手动释放
    _controller.dispose();
  }
}

/*
* 测试三：1. 监听滚动状态；2. 浮动按钮根据条件判断，显示或隐藏；
* */
// class KYHomePage extends StatefulWidget {
//   // 因为需要保存一个标记，用来判断浮动按钮的显示或隐藏，
//   // 所以需要让 KYHomePage 继承子 StatefulWidge，并创建一个 State
//   _KYHomePageState createState() => _KYHomePageState();
// }
//
// class _KYHomePageState extends State<KYHomePage> {
//   // 创建控制 ListView 滚动的管理类，显示时默认滚到 300 的位置
//   ScrollController _controller = ScrollController(initialScrollOffset: 300);
//   // 是否显示浮动按钮
//   bool _isShowFloatingBtn = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // 监听滚动
//     _controller.addListener(() {
//       // 打印滚动状态
//       print("监听到滚动。。。：${_controller.offset}");
//       // 更新UI
//       setState(() {
//         // 滚动距离大鱼 1000 时，显示浮动按钮
//         _isShowFloatingBtn = _controller.offset >= 1000;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 导航栏
//       appBar: AppBar(
//         title: Text("ListView"),
//       ),
//       // 列表
//       body: ListView.builder(
//         // 滚动管理器
//         controller: _controller,
//         // 共200条
//         itemCount: 200,
//         // 创建需要显示的 ListTItle
//         itemBuilder: (BuildContext cxt, int index) {
//           // 实时创建需要显示的 ListTitle
//           return ListTile(
//             // 最左侧显示头像 icon
//             leading: Icon(Icons.people),
//             // 标题部分显示文字
//             title: Text("联系人$index"),
//           );
//         },
//       ),
//       // 浮动按钮，当 _isShowFloatingBtn == true 时创建，否则是 null
//       floatingActionButton: _isShowFloatingBtn ? FloatingActionButton(
//         // 向上箭头
//         child: Icon(Icons.arrow_upward),
//         // 点击事件
//         onPressed: () {
//           // 滚动到 0 处，动画时长 1s，动画方式 easeIn
//           _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
//         },
//       ): null,
//     );
//   }
// }

/*
* 测试二：1. 让 ListView 回到指定位置；2. 让 ListView 显示时默认滚动到指定位置
* */
// class KYHomePage extends StatelessWidget {
//   // 创建控制 ListView 滚动的管理类，显示时默认滚到 300 的位置
//   ScrollController _controller = ScrollController(initialScrollOffset: 300);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 导航栏
//       appBar: AppBar(
//         title: Text("ListView"),
//       ),
//       // 列表
//       body: ListView.builder(
//         // 滚动管理器
//         controller: _controller,
//         // 共200条
//         itemCount: 200,
//         // 创建需要显示的 ListTItle
//         itemBuilder: (BuildContext cxt, int index) {
//           // 实时创建需要显示的 ListTitle
//           return ListTile(
//             // 最左侧显示头像 icon
//             leading: Icon(Icons.people),
//             // 标题部分显示文字
//             title: Text("联系人$index"),
//           );
//         },
//       ),
//       // 浮动按钮
//       floatingActionButton: FloatingActionButton(
//         // 向上箭头
//         child: Icon(Icons.arrow_upward),
//         // 点击事件
//         onPressed: () {
//           // 滚动到 0 处，动画时长 1s，动画方式 easeIn
//           _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
//         },
//       ),
//     );
//   }
// }

/*
* 测试一：创建 ListView
* */
// class KYHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ListView"),
//       ),
//       body: ListView.builder(
//         // 共200条
//         itemCount: 200,
//         // 创建需要显示的 ListTItle
//         itemBuilder: (BuildContext cxt, int index) {
//           // 实时创建需要显示的 ListTitle
//           return ListTile(
//             leading: Icon(Icons.people),
//             title: Text("联系人$index"),
//           );
//         },
//       ),
//     );
//   }
// }
