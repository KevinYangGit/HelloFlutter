import 'package:flutter/material.dart';

class KYDetail extends StatelessWidget {
  static const String routeName = '/detail';
  final String _detailMessage;

  KYDetail(this._detailMessage);

  @override
  Widget build(BuildContext context) {
    /*
    第三种返回：拦截系统返回事件，调用自定义返回方法，并传参
    */
    return PopScope(
      // 取消系统返回
      canPop: false,
      // 自定义返回
      onPopInvoked: (didPop) {
        // 防止重复点击
        if (didPop) return;
        _backToHome(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('详情'),
          /*
          // 第二种返回：自定义返回按钮，实现返回方法
          leading: IconButton(
            onPressed: () => _backToHome(context),
             icon: Icon(Icons.arrow_back)
          ),
          */
        ),
        body: Center(
          child: Column(
            children: [
              Text('$_detailMessage'),
              // 第一种返回：点击按钮，返回到上一页，并携带参数
              OutlinedButton(
                onPressed: () {
                  _backToHome(context);
                }, 
                child: Text('返回首页')
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
  使用 Navigator.of(context).pop('参数') 返回到上一页，pop() 方法内可以传递参数
  */
  void _backToHome(BuildContext context) {
    Navigator.of(context).pop('a detail message');
  }
}
