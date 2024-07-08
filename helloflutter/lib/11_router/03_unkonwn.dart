
import 'package:flutter/material.dart';

class KYUnknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('错误页'),
      ),
      body: Center(
        child: Text('发生错误'),
      ),
    );
  }
}