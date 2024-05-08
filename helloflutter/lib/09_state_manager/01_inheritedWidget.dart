
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class KYShareData extends InheritedWidget {
  // 1.共享数据
  final counter;

  // 2.定义构造方法
  @override
  KYShareData({this.counter, required Widget child}) : super(child: child);

  // 3.获取当前 InheritedWidget
  static KYShareData? of(BuildContext context) {
    // 沿着 Element 树，查找最近的 InheritedElement，取出 widget 对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.是否通知子 widget（true：调用 state 中的 didChangeDependencies() 方法）
  bool updateShouldNotify(KYShareData oldChild) {
    return oldChild.counter != counter;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _counter = 100;
  @override
  Widget build(BuildContext context) {
    print('_HomePageState build()');
    return Scaffold(
      body: KYShareData(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KYTextLessWidget(),
              KYTextFulWidget()
            ],
          ),
        ) 
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        setState(() {
          _counter++;
        });
      }),
    );
  }
}

// 案例一：StatelessWidget 使用共享数据
class KYTextLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('KYTextLessWidget build()');
    return Container(
      color: Colors.red,
      child: Text('当前计数：${KYShareData.of(context)?.counter}'),
    );
  }
}

// 案例二：StatefulWidget 使用共享数据
class KYTextFulWidget extends StatefulWidget {
  State createState() => _KYTextFulWidget();
}

class _KYTextFulWidget extends State<KYTextFulWidget> {
  @override
  Widget build(BuildContext context) {
    print('_KYTextFulWidget build()');
    return Container(
      color: Colors.blue,
      child: Text('当前计数：${KYShareData.of(context)?.counter}'),
    );
  }
}
