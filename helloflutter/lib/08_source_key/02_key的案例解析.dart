
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final names = ["we don't even konw if he'll propose", "check this out", "what did you konw"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("key测试"),
      ),
      body: ListView(
        children: names.map((e) {
          // 1.因为 key 相同（element），所以不会重新创建 ListTileFul
          // return ListTileFul(e, key: ValueKey(e));
          // 或
          return ListTileFul(e);

          // 2.因为 key 不相同（element），所以会重新创建 ListTileFul
          // return ListTileFul(e, key: UniqueKey());
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        }),
    );
  }
}

/*
测试一：删除一个，重新创建其他的
*/
class ListTileLess extends StatelessWidget {
  final name;
  final randomColor = Color.fromARGB(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  ListTileLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: Text(name),
      color: randomColor,
    );
  }
}

/*
参考：

StatelessContainer 比较过程

在 StatelessContainer 中，我们并没有传入 key ，所以只比较它们的 runtimeType。
我们将 color 属性定义在了 Widget 中，这将导致他们具有不同的 runtimeType。
所以在 StatelessContainer 这个例子中，Flutter能够正确的交换它们的位置。

StatefulContainer 比较过程

而在 StatefulContainer 的例子中，我们将 color 的定义放在了 State 中，Widget 并不保存 State，真正 hold State 的引用的是 Stateful Element。
当我们没有给 Widget 任何 key 的时候，将会只比较这两个 Widget 的 runtimeType 。
由于两个 Widget 的属性和方法都相同，canUpdate 方法将会返回 false，在 Flutter 看来，并没有发生变化。
所以这两个 Element 将不会交换位置。
而我们给 Widget 一个 key 之后，canUpdate 方法将会比较两个 Widget 的 runtimeType 以及 key。并返回 true，现在 Flutter 就可以正确的感知到两个 Widget 交换了顺序了。 （这里 runtimeType 相同，key 不同）
*/
class ListTileFul extends StatefulWidget {
  final name;
  ListTileFul(this.name, {Key? key}) : super(key: key);
  State createState() => _ListTileFulState();
}

class _ListTileFulState extends State<ListTileFul> {
  /*
  满足两个条件，实现 ListTileFul 不重新创建
  1.randomColor 放在 State 中
  2.传入 key: ValueKey(e)
  */ 
  final randomColor = Color.fromARGB(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: Text(widget.name),
      color: randomColor,
    );
  }
}