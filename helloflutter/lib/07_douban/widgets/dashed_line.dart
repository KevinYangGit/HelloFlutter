import 'package:flutter/material.dart';

class KYDashedLine extends StatelessWidget {
  final Axis axis;
  final double width;
  final double height;
  final int count;
  final Color color;

  const KYDashedLine({
    super.key,
    this.axis = Axis.horizontal,
    this.width = 1,
    this.height = 1,
    this.count = 10,
    this.color = Colors.grey
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        // 使用const关键字来修饰构造函数可以提高性能,因为是不会发生变化的
        return SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
           decoration: BoxDecoration(color: color),
         ),
        );
      }),
    );
  }
}