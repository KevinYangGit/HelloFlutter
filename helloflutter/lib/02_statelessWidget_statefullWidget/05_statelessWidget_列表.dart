/*
Padding 设置内边距使用的Widget，它有一个padding属性用于设置边距大小；

Column 处置排列子 Widget

黄色的斑马线
因为在Flutter的布局中，内容是不能超出屏幕范围的，当超出时不会自动变成滚动效果，而是会报下面的错误；
将Column换成ListView即可解决这个问题呢；ListView可以让自己的子Widget变成滚动的效果；

希望给图片和文字之间添加一些间距，怎么做呢？
方式一：给图片或者文字添加一个向上的内边距或者向下的内边距；
方式二：使用SizedBox的Widget，设置一个height属性，可以增加一些距离；
*/

import 'package:flutter/material.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KYHome(),
    );
  }
}

class KYHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
      ),
      body: KYBody(),
    );
  }
}

class KYBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 垂直排列 Widget，类比 Row
    // return Column(
    // 内边距
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [
          KYProductItem('title01', '图片', 'https://pic3.zhimg.com/v2-002ce6e2ee957e0f666a7bfa479f33b2_r.jpg'),
          KYProductItem('title02', '图片', 'https://pic2.zhimg.com/v2-2aebdafa0ab8ee5b55d58410f7192745_r.jpg'),
          KYProductItem('title02', '图片', 'https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg'),
        ],
      ),
    );
    // return ListView(
    //   children: [
    //     KYProductItem('title01', '图片', 'https://pic3.zhimg.com/v2-002ce6e2ee957e0f666a7bfa479f33b2_r.jpg'),
    //     KYProductItem('title02', '图片', 'https://pic2.zhimg.com/v2-2aebdafa0ab8ee5b55d58410f7192745_r.jpg'),
    //     KYProductItem('title02', '图片', 'https://pic4.zhimg.com/v2-cb75f239dfd0c1c42c23dfc9011965a3_b.jpg'),
    //   ],
    // );
  }
}

// 产品信息
class KYProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  KYProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all()
      ),
      // 垂直排列
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 30, color: Colors.blue),), // 标题
          Text(desc, style: TextStyle(fontSize: 20, color: Colors.black),), // 详情
          SizedBox(height: 18,),
          Image.network(imageURL), // 网络图片
        ],
      ),
    );
  }
}