import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("图片"),
        ),
        body: MyBody(),
      ),
    );
  }
}

/*
圆角图片
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Image.network(
//             'https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg',
//             width: 200,
//             height: 200,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
                "https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/*
头像
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 2, color: Colors.red),
//         ),
//         child: ClipOval(
//           child: Image.network(
//             "https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg",
//             fit: BoxFit.cover,
//             width: 200,
//             height: 200,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.red, width: 10),
//           borderRadius: BorderRadius.all(Radius.circular(100)),
//           image: DecorationImage(
//             image: AssetImage("assets/images/01.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.red, width: 2),
//         ),
//         child: CircleAvatar(
//           radius: 100,
//           backgroundImage: AssetImage('assets/images/01.png'),
//         ),
//       ),
//     );
//   }
// }

/*
本地图片
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 300,
//         height: 400,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.red, width: 2),
//         ),
//         child: Image.asset('assets/images/01.png'),
//       ),
//     );
//   }
// }

/*
网络图片
*/

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 300,
//             height: 400,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.red, width: 2),
//             ),
//             child: Image.network(
//               "https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg",
//               alignment: Alignment.center,
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
