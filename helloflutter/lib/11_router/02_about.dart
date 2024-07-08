
import 'package:flutter/material.dart';

class KYAbout extends StatelessWidget {
  static const String routeName = '/about';
  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$message'),
            OutlinedButton(
              onPressed: ()=>_backToHome(context),
              child: Text('返回首页')
            )
          ],
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop('a aboult message');
  }
}