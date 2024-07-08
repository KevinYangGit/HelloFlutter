/*
在Flutter中，我们可以将文本的控制显示分成两类：

控制文本布局的参数： 如文本对齐方式 textAlign、文本排版方向 textDirection，文本显示最大行数 maxLines、文本截断规则 overflow 等等，这些都是构造函数中的参数；
控制文本样式的参数： 如字体名称 fontFamily、字体大小 fontSize、文本颜色 color、文本阴影 shadows 等等，这些参数被统一封装到了构造函数中的参数 style 中；

TextSpan 富文本（在Android中，我们可以使用SpannableString，在iOS中，我们可以使用NSAttributedString完成，了解即可）
*/

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: MyBody(),
    );
  }
}

/*
富文本
 */

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "《登高》",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            TextSpan(
                text: "唐·杜甫",
                style: TextStyle(fontSize: 18, color: Colors.blue)),
            TextSpan(
                text:
                    "\n风急天高猿啸哀，渚清沙白鸟飞回。\n无边落木萧萧下，不尽长江滚滚来。\n万里悲秋常作客，百年多病独登台。\n艰难苦恨繁霜鬓，潦倒新停浊酒杯。"),
          ],
        ),
        style: TextStyle(fontSize: 16, color: Colors.green),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/*
Text 的基本属性
 */

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "《登高》唐·杜甫风急天高猿啸哀，渚清沙白鸟飞回。无边落木萧萧下，不尽长江滚滚来。万里悲秋常作客，百年多病独登台。艰难苦恨繁霜鬓，潦倒新停浊酒杯。",
//       textAlign: TextAlign.center, // 居中对齐
//       maxLines: 2, // 最大显示两行
//       overflow: TextOverflow.ellipsis, // 超出部分显示 ...
//       textScaleFactor: 1.25, // 文本放大 1.25 倍
//       style: TextStyle(
//         fontSize: 18,
//         color: Colors.black,
//       ),
//     );
//   }
// }

/*
多行显示 """ """
 */

// class MyBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Colors.red),
//       ),
//       child: const Text(
//         "《登高》唐·杜甫风急天高猿啸哀，渚清沙白鸟飞回。无边落木萧萧下，不尽长江滚滚来。万里悲秋常作客，百年多病独登台。艰难苦恨繁霜鬓，潦倒新停浊酒杯。",
//         style: TextStyle(
//           fontSize: 18,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }
