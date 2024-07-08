/*
1、Image组件有很多的构造函数，我们这里主要学习两个：
Image.assets：加载本地资源图片；
Image.network：加载网络中的图片；


2、width、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。
fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。

3、color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式；
4、repeat：当图片本身大小小于显示空间时，指定图片的重复规则。

实现圆角头像
方式一：CircleAvatar可以实现圆角头像，也可以添加一个子Widget
方式二：ClipOval也可以实现圆角头像，而且通常是在只有头像时使用
方式三：Container+BoxDecoration

实现圆角图片
方式一：ClipRRect用于实现圆角效果，可以设置圆角的大小。
方式二：Container+BoxDecoration
*/

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
