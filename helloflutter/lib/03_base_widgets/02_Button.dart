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
        title: Text("FloatingActionButton"),
      ),
      body: MyBody(),
    );
  }
}

/*
///  * [ElevatedButton], a filled button whose material elevates when pressed .
///  * [FilledButton], a filled button that doesn't elevate when pressed.
///  * [FilledButton.tonal], a filled button variant that uses a secondary fill color.
///  * [OutlinedButton], a button with an outlined border and no fill color.
///  * [TextButton], a button with no outline or fill color.
 */

/*
自定义样式
*/

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text(
              "自定义样式",
              style: TextStyle(color: Colors.red), // 字体颜色
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen, // 背景色
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)), // 设置圆角
              elevation: 2, // 通过添加阴影，设置按钮漂浮高度
            ),
            onPressed: () {
              print("FilledButton click");
            },
          ),
        ],
      ),
    );
  }
}

/*
图标按钮
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () {
//               print("IconButton click");
//             },
//             icon: Icon(Icons.add),
//           ),
//           IconButton.filled(
//             onPressed: () {
//               print("IconButton.filled click");
//             },
//             icon: Icon(Icons.send),
//           ),
//           IconButton.filledTonal(
//             onPressed: () {
//               print("IconButton.filledTonal click");
//             },
//             icon: Icon(Icons.search),
//           ),
//           IconButton.outlined(
//             onPressed: () {
//               print("IconButton.outlined click");
//             },
//             icon: Icon(Icons.list),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
文本按钮，默认背景透明不带阴影。按下后，会有背景色
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton(
//             onPressed: () {
//               print("TextButton click");
//             },
//             child: Text("01"),
//           ),
//           TextButton(
//             onPressed: () {
//               print("TextButton 02 click");
//             },
//             child: Text("02"),
//           ),
//           TextButton.icon(
//             onPressed: () {
//               print("TextButton.icon click");
//             },
//             icon: Icon(Icons.add),
//             label: Text("03"),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
边框按钮
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           OutlinedButton(
//             onPressed: () {
//               print("OutlinedButton click");
//             },
//             child: Text("01"),
//           ),
//           OutlinedButton.icon(
//             onPressed: () {
//               print("OutlinedButton.icon click");
//             },
//             icon: Icon(Icons.add),
//             label: Text("02"),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
全角按钮
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FilledButton(
//             onPressed: () {
//               print("FilledButton click");
//             },
//             child: Text("01"),
//           ),
//           FilledButton.icon(
//             onPressed: () {
//               print("FilledButton.icon Click");
//             },
//             icon: Icon(Icons.add),
//             label: Text("02"),
//           ),
//           FilledButton.tonal(
//             onPressed: () {
//               print("FilledButton.tonal Click");
//             },
//             child: Text("03"),
//           ),
//           FilledButton.tonalIcon(
//             onPressed: () {
//               print("FilledButton.tonalIcon Click");
//             },
//             icon: Icon(Icons.add),
//             label: Text("04"),
//           ),
//         ],
//       ),
//     );
//   }
// }

/*
漂浮按钮
*/
// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               print("ElevatedButton Click");
//             },
//             child: Text("01"),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               print("ElevatedButton Click");
//             },
//             icon: Icon(Icons.add),
//             label: Text("02"),
//           ),
//         ],
//       ),
//     );
//   }
// }


/*
浮动按钮
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           /*
//           1."圆形"按钮，默认带有阴影和灰色背景。按下后，阴影会变大
//           */
//           FloatingActionButton(
//             onPressed: () {
//               print("FloatingActionButton Click");
//             },
//             child: Text("01"),
//           ),
//           FloatingActionButton.small(
//             onPressed: () {
//               print("FloatingActionButton.small Click");
//             },
//             child: Text("02"),
//           ),
//           FloatingActionButton.large(
//             onPressed: () {},
//             child: Text("03"),
//           ),
//           FloatingActionButton.extended(
//             onPressed: () {
//               print("FloatingActionButton.extended Click");
//             },
//             label: Text("- 04 -"),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           /*
//           1."圆形"按钮，默认带有阴影和灰色背景。按下后，阴影会变大
//           */
//           FloatingActionButton(
//             onPressed: () {
//               print("FloatingActionButton Click");
//             },
//             child: Text("FloatingActionButton"),
//           ),

//           /*
//           2.“漂浮”按钮，默认带有阴影和灰色背景。按下后，阴影会变大
//           */
//           ElevatedButton(
//             onPressed: () {
//               print("ElevatedButton Click");
//             },
//             child: Text(
//               "ElevatedButton",
//               style: TextStyle(color: Colors.red),
//             ),
//           ),

//           /*
//           3.“全圆角”按钮，默认按钮两侧全圆角，不带阴影
//           */
//           FilledButton(
//             onPressed: () {
//               print("FilledButton Click");
//             },
//             child: Text("FilledButton"),
//           ),

//           /*
//           4.默认有一个边框，不带阴影切背景透明。按下后，边框颜色会变亮。同时出现背景和阴影（较弱）
//           */
//           OutlinedButton(
//             onPressed: () {
//               print("OutlinedButton Click");
//             },
//             child: Text("OutlinedButton"),
//           ),

//           /*
//           5.文本按钮，默认背景透明不带阴影。按下后，会有背景色
//           */
//           TextButton(
//             onPressed: () {
//               print("TextButton Click");
//             },
//             child: Text("TextButton"),
//           ),

//           /*
//           6.一个可点击的icon，不包括文字，默认没有背景，点击后出背景
//           */
//           IconButton(
//             onPressed: () {
//               print("IconButton Click");
//             },
//             icon: Icon(Icons.thumb_up),
//           ),

//           /*
//           7.带图标和文字的按钮
//           */
//           ElevatedButton.icon(
//             onPressed: () {
//               print("ElevatedButton Click");
//             },
//             icon: Icon(Icons.send),
//             label: Text("发送"),
//           ),

//           /*
//           8.带图标和文字的按钮
//           */
//           OutlinedButton.icon(
//             onPressed: () {
//               print("OutlinedButton Click");
//             },
//             icon: Icon(Icons.add),
//             label: Text("添加"),
//           ),

//           /*
//           9.带图标和文字的按钮
//           */
//           TextButton.icon(
//             onPressed: () {
//               print("TextButton Click");
//             },
//             icon: Icon(Icons.info),
//             label: Text("详情"),
//           )
//         ],
//       ),
//     );
//   }
// }