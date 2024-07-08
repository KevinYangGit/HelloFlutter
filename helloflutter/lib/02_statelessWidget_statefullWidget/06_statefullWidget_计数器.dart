/*
1、Flutter将StatefulWidget设计成了两个类，也就是你创建StatefulWidget时必须创建两个类：
一个类继承自StatefulWidget，作为Widget树的一部分；
一个类继承自State，用于记录StatefulWidget会变化的状态，并且根据状态的变化，构建出新的Widget；

2、Flutter小部件的生命周期：
StatelessWidget可以由父Widget直接传入值，调用build方法来构建，整个过程非常简单；
而StatefulWidget需要通过State来管理其数据，并且还要监控状态的改变决定是否重新build整个Widget；


3、首先，执行StatefulWidget中相关的方法：

1>执行StatefulWidget的构造函数（Constructor）来创建出StatefulWidget；
2>执行StatefulWidget的createState方法，来创建一个维护StatefulWidget的State对象；

其次，调用createState创建State对象时，执行State类的相关方法：

1>执行State类的构造方法（Constructor）来创建State对象；
2>执行initState，我们通常会在这个方法中执行一些数据初始化的操作，或者也可能会发送网络请求；

注意：这个方法是重写父类的方法，必须调用super，因为父类中会进行一些其他操作；
并且如果你阅读源码，你会发现这里有一个注解（annotation）：@mustCallSuper

3>执行didChangeDependencies方法，这个方法在两种情况下会调用
情况一：调用initState会调用；
情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget（这个后面会讲到）；

4>Flutter执行build方法，来看一下我们当前的Widget需要渲染哪些Widget；
5>当前的Widget不再使用时，会调用dispose进行销毁；
6>手动调用setState方法，会根据最新的状态（数据）来重新调用build方法，构建对应的Widgets；
7>执行didUpdateWidget方法是在当父Widget触发重建（rebuild）时，系统会调用didUpdateWidget方法；
*/

import 'package:flutter/material.dart';

main() => runApp(MyApp());

// 程序
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KYHome(),
    );
  }
}

// 页面
class KYHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器'),
      ),
      body: KYBody(),
    );
  }
}

// 页面-内容
class KYBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('KYBody build');
    return KYMutableContext();
  }
}

// 可变内容
class KYMutableContext extends StatefulWidget {

  KYMutableContext() {
    print('KYMutableContext 构造方法');
  }
  @override
  State<StatefulWidget> createState() {
    print('KYMutableContext createState');
    return KYState();
  }
}

// 可变内容-状态
class KYState extends State<KYMutableContext> {
  // 计数
  var count = 0;

  KYState() {
    print('KYState 构造方法');
  }

  void initState() {
    super.initState();
    print('KYState init方法');
  }

  @override
  void didChangeDependencies() {
    print('KYState didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('KYState build');
    return Center(
      // 垂直布局
      child: Column(
        // 垂直-居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 水平布局
          Row(
            // 水平-居中
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // +1 按钮
              MaterialButton(
                color: Colors.blue,
                child: const Text("+1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: (){
                  // 调用一个State中默认给我们提供的setState方法，在回调函数中修改我们的变量
                  setState(() {
                    count++;
                  });
                },
              ),
              // -1 按钮
              MaterialButton(
                color: Colors.red,
                child: const Text('-1', style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: (){
                  setState(() {
                    count--;
                  });
                },
              ),
            ],
          ),
          Text('当前计数：$count'),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant KYMutableContext oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('KYState didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    print('KYState dispose');
  }
}

// class extends StatefulWidget {
//   const ({Key? key}) : super(key: key);
//
//   @override
//   State<> createState() => _State();
// }
//
// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

