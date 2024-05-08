
import 'package:flutter/material.dart';
import 'package:helloflutter/09_state_manager/02_Provider_basic/counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // 第二步：在Widget Tree中插入ChangeNotifierProvider
    // Widget树中提供数据（状态）的地方，会在其中创建对应的ChangeNotifier
    // 将ChangeNotifierProvider放到了顶层，这样方便在整个应用的任何地方可以使用CounterProvider
    ChangeNotifierProvider(
      create: (cxt) => KYCounterPrivoder(),
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
参数三：child，目的是进行优化，如果builder下面有一颗庞大的子树，当模型发生改变的时候，我们并不希望重新build这颗子树，那么就可以将这颗子树放到Consumer的child中，在这里直接引入即可（注意我案例中的Icon所放的位置）；
*/
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 的使用一'),
      ),
      body: Center(
        // 3.1 引入位置一：在body中使用Consumer，Consumer需要传入一个builder回调函数，当数据发生变化时，就会通知依赖数据的Consumer重新调用builder方法来构建；
        child: Consumer<KYCounterPrivoder>(
          builder: (context, value, child) {
            return Text('当前计数：${value.counter}');
          },
        )
      ),
      // 3.2 引入位置二：在floatingActionButton中使用Consumer，当点击按钮时，修改CounterNotifier中的counter数据；
      floatingActionButton: Consumer<KYCounterPrivoder>(
        builder: (context, value, child) {
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
