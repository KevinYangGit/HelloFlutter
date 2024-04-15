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

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//               image: NetworkImage(
//                   "https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg")),
//         ),
//       ),
//     );
//   }
// }
/*
Container+BoxDecoration
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
// */

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.lightGreen,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Text(
              "风急天高猿啸哀，渚清沙白鸟飞回。无边落木萧萧下，不尽长江滚滚来。万里悲秋常作客，百年多病独登台。艰难苦恨繁霜鬓，潦倒新停浊酒杯。"),
        ),
      ),
    );
  }
}

/*
Center
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
