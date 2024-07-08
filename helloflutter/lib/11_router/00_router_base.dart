import 'package:flutter/material.dart';
import 'package:helloflutter/11_router/01_detail.dart';
import 'package:helloflutter/11_router/02_about.dart';
import 'package:helloflutter/11_router/03_unkonwn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push',
      theme:
          ThemeData(primaryColor: Colors.blue, splashColor: Colors.transparent),
      // 1. 设置路由
      routes: {
        // 首页
        '/': (ctx) => KYHomePage(),
        // 关于，使用路由时，不能在初始化方法中添加参数
        '/about': (ctx) => KYAbout()
      },
      //home: KYHomePage(),
      // 2.使用路由初始化 KYHomePage()
      initialRoute: '/',
      // 3.对于没有在 routers 中配置的路由，支持动态生成路由
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          return MaterialPageRoute(builder: (ctx) {
            String message = 'null';
            if (settings.arguments != null) {
              message = settings.arguments as String;
            }
            return KYDetail(message);
          });
        }
      },
      // 4.当 routes 和 onGenerateRoute 方法都没有实现时，直接跳转错误页
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (ctx) => KYUnknown());
      }),
    );
  }
}

class KYHomePage extends StatefulWidget {
  @override
  State createState() => _KYHomePageState();
}

class _KYHomePageState extends State<KYHomePage> {
  String _homeMessage = 'home message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_homeMessage'),
            OutlinedButton(
                onPressed: () {
                  _jumpToDetail(context);
                },
                child: Text('详情')),
            OutlinedButton(
                onPressed: () {
                  _jumpToAbout(context);
                },
                child: Text('关于')),
            OutlinedButton(
                onPressed: () {
                  _jumpToDetail2(context);
                },
                child: Text('详情-路由')),
            OutlinedButton(
                onPressed: () {
                  _jumpToUnknown();
                },
                child: Text('未知页面'))
          ],
        ),
      ),
    );
  }

  /*
  第一种跳转：普通跳转
  1. Navigator.of(context).push()
  2. push() 的参数类型要求 MaterialPageRoute 类型
  3. 使用 Future 接收返回信息
  */
  void _jumpToDetail(BuildContext context) {
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return KYDetail('a home message');
    }));

    // 获取返回信息
    result.then((value) {
      if (value != Null) {
        setState(() {
          _homeMessage = value;
        });
      }
    });
  }

  /*
  第二种跳转：路由跳转
  1. 在 MaterialApp() 中配置 routers 属性
  2. routers 是一个字典，添加关于页面的路由 `'/about': (ctx) => KYAbout()`
  3. 使用 pushName() 方法实现路由跳转 `Navigator.of(context).pushNamed('/about', arguments: '参数');`
  4. 使用 Future 接收返回数据
  */
  void _jumpToAbout(BuildContext context) {
    // 3.使用路由跳转
    Future result =
        Navigator.of(context).pushNamed('/about', arguments: 'a home message');

    result.then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  /*
  第三种跳转：路由没有配置，动态生成路由，然后跳转
  1. 在 MaterialApp() 中的 routers 里没有添加路由配置
  2. 在 MaterialApp() 中的 onGenerateRoute 里添加对应路由的创建代码，实现动态生成路由
  3. 使用 pushName() 实现路由跳转
  4. 使用 Future 接收返回数据
  */
  void _jumpToDetail2(BuildContext context) {
    Future result =
        Navigator.of(context).pushNamed('/detail', arguments: 'a home message');
    result.then((value) {
      setState(() {
        _homeMessage = value;
      });
    });
  }

  /*
  第四种跳转：跳转错误页
  1. 路由既没有在 routers 中配置，也没有在 onGenerateRoute 中动态生成，则默认跳转错误页
  2. 在 MateiralApp() 中的 onUnknownRoute 实现错误页面的路由
  */
  void _jumpToUnknown() {
    Navigator.of(context).pushNamed('/123');
  }
}
