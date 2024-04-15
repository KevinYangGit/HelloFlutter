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