
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget{
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;

  const StarRating({
    super.key,
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.selectedColor = const Color(0xffff0000),
    this.unselectedColor = const Color(0xffbbbbbb),
  });

  @override
  Widget build(BuildContext context) {
    // 使用 Stack 支持重叠布局
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildUnSelectStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  // 灰色星星
  List<Widget> buildUnSelectStar() {
    return List.generate(count, (index) {
      return Icon(Icons.star, color: unselectedColor, size: size);
    });
  }

  // 亮星星
  List<Widget> buildSelectedStar() {
    // 1. 创建星星数组
    List<Widget> stars = [];
    final star = Icon(Icons.star, color: selectedColor, size: size);
    // 2. 计算全填充的星星数量
    double oneValue = maxRating / count;
    int entireCount = (rating / oneValue).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
    // 3. 没有填充满的星星
    // 3.1. 计算
    double leftWidth = ((rating / oneValue) - entireCount) * size; 
    // 3.2. 裁剪
    final halfStar = ClipRect(
      // 3.3. 裁剪器
      clipper: KYStarClipper(leftWidth),
      // 3.4. 裁剪对象
      child: star
    );
    stars.add(halfStar);

    if (stars.length > count) {
      return stars.sublist(0, count);
    }
    return stars;
  }
}

// 自定义裁剪器
class KYStarClipper extends CustomClipper<Rect> {
  // 1. 自定义宽度属性 + 构造方法
  double width;
  KYStarClipper(this.width);
  // 2. 是否需要裁剪
  @override
  bool shouldReclip(KYStarClipper oldClipper) {
    return oldClipper.width != width;
  }
  // 3. 裁剪范围
  // 坑：Size 没识别出来，先 import 'dart:ui';，再去掉ok了
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, width, size.height);
  }
}
