
import 'package:flutter/material.dart';
import 'package:helloflutter/09_state_manager/01_inheritedWidget.dart';
import 'package:helloflutter/09_state_manager/Model/counter_view_model.dart';
import 'package:provider/provider.dart';

// 第一步在 KYCounterViewModel.dart 类
void main() {
  runApp(
    // 第二步：在Widget Tree中插入ChangeNotifierProvider
    // Widget树中提供数据（状态）的地方，会在其中创建对应的ChangeNotifier
    // 将ChangeNotifierProvider放到了顶层，这样方便在整个应用的任何地方可以使用CounterProvider
    ChangeNotifierProvider(
      create: (cxt) => KYCounterViewModel(),
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// 第三步：在首页中使用Consumer引入和修改状态
/*
Consumer的builder方法解析：

参数一：context，每个build方法都会有上下文，目的是知道当前树的位置；
参数二：ChangeNotifier对应的实例，也是我们在builder函数中主要使用的对象；
参数三：child，目的是进行优化，如果builder下面有一颗庞大的子树，
      当模型发生改变的时候，我们并不希望重新build这颗子树，
      那么就可以将这颗子树放到Consumer的child中，在这里直接引入即可（注意我案例中的Icon所放的位置）；
*/
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('HomePage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 的使用一'),
      ),
      body: Center(
        // 3.1 引入位置一：在body中使用Consumer，Consumer需要传入一个builder回调函数，当数据发生变化时，就会通知依赖数据的Consumer重新调用builder方法来构建；
        // <KYCounterViewModel> 制定参数 value 的类型
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KYTextLessWidget01(),
            KYTextFulWidget01()
          ],
        )
      ),
      // 3.2 引入位置二：在floatingActionButton中使用Consumer，当点击按钮时，修改CounterNotifier中的counter数据；
      floatingActionButton: Consumer<KYCounterViewModel>(
        builder: (context, value, child) {
          print('HomePage floatingActionButton builder()');
          return FloatingActionButton(
            child: child,
            onPressed: () {
              value.counter++;
            });
        },
        child: Icon(Icons.add)
      )
    );
  }
}

class KYTextLessWidget01 extends StatelessWidget {
  @override
  Widget build(contexnt) {
    // 数据源改变时，不调用 build 方法
    print('KYTextLessWidget01 build()');
    return Consumer<KYCounterViewModel>(
      // 4.1数据源改变时，调用 builder 方法
      builder: (context, value, child) {
        print('KYTextLessWidget01 Consumer builder()');
        return Text('01当前计数：${value.counter}');
      }
    );
  }
}

// 第四步：局部更新Widget
class KYTextFulWidget01 extends StatefulWidget {
  @override
  State createState() => _KYTextFulWidgetState01();
}

class _KYTextFulWidgetState01 extends State<KYTextFulWidget01> {
  @override
  Widget build(context) {
    // 数据源改变时，不调用 build 方法
    print('_KYTextFulWidgetState01 build()');
    return Consumer<KYCounterViewModel>(
      // 4.2数据源改变时，调用 builder 方法
      builder: (context, value, child) {
        print('_KYTextFulWidgetState01 - Consumer - builder()');
        return Text('01当前计数：${value.counter}');
      }
    );
  }
}

/*
启动时打印信息：
flutter: HomePage build()
flutter: KYTextLessWidget01 build()
flutter: KYTextLessWidget01 Consumer builder()
flutter: _KYTextFulWidgetState01 build()
flutter: _KYTextFulWidgetState01 - Consumer - builder()
flutter: HomePage floatingActionButton builder()
修改数据源时的打印信息：
flutter: _KYTextFulWidgetState01 - Consumer - builder()
flutter: KYTextLessWidget01 Consumer builder()
flutter: HomePage floatingActionButton builder()
*/
