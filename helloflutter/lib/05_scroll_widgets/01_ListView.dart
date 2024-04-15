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
