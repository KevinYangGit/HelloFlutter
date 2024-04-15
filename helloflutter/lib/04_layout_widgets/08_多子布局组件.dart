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
Expanded
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
