import 'package:flutter/material.dart';
import 'package:helloflutter/11_router/03_unkonwn.dart';
import './01_detail.dart';
import './main.dart';
import './02_about.dart';

class KYRouter {
  // 1.支持路由白名单
  static final Map<String, WidgetBuilder> routes = {
    KYHomePage.routeName: (context) => KYHomePage(),
    KYAbout.routeName: (context) => KYAbout()
  };
  /*
  // 定义成函数
  // 调用方式：onGenerateRoute: (settings) => KYRouter.generateRoute(settings),
  static MaterialPageRoute? generateRoute(settings) {
    if (settings.name == KYDetail.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        String message = '';
        if (settings.arguments != null) {
          message = settings.arguments as String;
        }
        return KYDetail(message);
      });
    }
    return null;
  }
  */

  // 将函数定义成变量（闭包，类似iOS中的block）
  // 调用方式：onGenerateRoute: KYRouter.myGenerateRoute,

  // 2.动态生成路由
  static final RouteFactory myGenerateRoute = (settings) {
    if (settings.name == KYDetail.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        String message = '';
        if (settings.arguments != null) {
          message = settings.arguments as String;
        }
        return KYDetail(message);
      });
    }
    return null;
  };

  // 3.路由跳转错误页面
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => KYUnknown());
  };

}
