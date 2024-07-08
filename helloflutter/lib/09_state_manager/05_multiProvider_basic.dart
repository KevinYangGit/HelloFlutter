
import 'package:flutter/material.dart';
import 'package:helloflutter/07_douban/model/home_model.dart';
import 'package:helloflutter/09_state_manager/Model/counter_view_model.dart';
import 'package:helloflutter/09_state_manager/Model/init_providers.dart';
import 'package:helloflutter/09_state_manager/Model/user_view_model.dart';
import 'package:provider/provider.dart';

/*
使用 Selector ，可以避免 floatingActionButton 的 builder 方法的重复调用
*/

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: KYMyApp(),
    )
  );
}

class KYMyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: KYHomePage(),
    );
  }
}

class KYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KYTextLessWidget01(),
            KYTextFulWidget02(),
            KYTextFulWidget03()
          ],
        ),
      ),
      floatingActionButton: Selector<KYCounterViewModel, KYCounterViewModel>(
        builder: (context, value, child) {
          print('KYHomePage - floatingActionButton - builder()');
          return FloatingActionButton(
            child: child,
            onPressed: () {
              value.counter++;
            }
          );
        }, 
        selector: (context, value) {
          return value;
        },
        shouldRebuild: (value1, value2) {
          return false;
        },
      ),
    );
  }
}

class KYTextLessWidget01 extends StatelessWidget {
  @override
  Widget build(context) {
    print("KYTextLessWidget01 - build()");
    return Consumer<KYCounterViewModel>(
        builder: (context, value, child) {
          return Text('当前计数：${value.counter}');
        }
      );
  }
}

class KYTextFulWidget02 extends StatefulWidget {
  @override
  State createState() => _KYTextFulWidgetState02();
}

class _KYTextFulWidgetState02 extends State<KYTextFulWidget02> {
  @override
  Widget build(BuildContext context) {
    print("_KYTextFulWidgetState02 - build()");
    return Consumer2<KYCounterViewModel, KYUserViewModel>(
      builder: (context, value1, value2, child) {
        return Text('用户名：${value2.user.nickName}, 年龄：${value2.user.level}');
      }
    );
  }
}

class KYTextFulWidget03 extends StatefulWidget {
  @override
  State createState() => _KYTextFulWidgetState03();
}

class _KYTextFulWidgetState03 extends State<KYTextFulWidget03> {
  @override
  Widget build(BuildContext context) {
    print("_KYTextFulWidgetState03 - build()");
    int counter = Provider.of<KYCounterViewModel>(context).counter;
    return Text('03当前计数：${counter}');
  }
}

/*
启动打印信息：
flutter: KYTextLessWidget01 - build()
flutter: _KYTextFulWidgetState02 - build()
flutter: _KYTextFulWidgetState03 - build()
flutter: KYHomePage - floatingActionButton - builder()

修改数据源时的打印信息：
flutter: _KYTextFulWidgetState03 - build()
*/