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

  // 当此对象插入到树中时调用。
  void initState() {
    super.initState();
    print('KYState init方法');
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

  // 每当小部件配置更改时调用。
  @override
  void didUpdateWidget(covariant KYMutableContext oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('KYState didUpdateWidget');
  }

  // 从树中删除此对象时调用。
  @override
  void deactivate() {
    super.deactivate();
    print('KYState deactivate');
  }

  // 当此对象从树中永久删除时调用。
  @override
  void dispose() {
    super.dispose();
    print('KYState dispose');
  }

  // 除了调用此方法外，还可以保证在发出重新组装信号时调用[build]方法。因此，大多数窗口小部件不需要在[重新组装]方法中执行任何操作。
  @override
  void reassemble() {
    super.reassemble();
    print('KYState reassemble');
  }

  // 当此[State]对象的依赖项更改时调用。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('KYState didChangeDependencies');
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

