
import 'package:flutter/material.dart';

main() {
  runApp(
      MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Flutter")
            ),
            body: Center(
              child: Text(
                'Hello world!',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.blue),
              ),
            )
        ),
      )
  );
}

/*
* 快捷键：
* 1. Opt + Command + L 代码对齐
* */