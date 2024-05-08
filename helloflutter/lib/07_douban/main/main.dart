

import 'package:flutter/material.dart';
import 'package:helloflutter/07_douban/home/home.dart';
import 'package:helloflutter/07_douban/subject/subject.dart';

class KYMainPage extends StatefulWidget {
  const KYMainPage({super.key});

  // 使用 _KYMainPageState 时报错 Invalid use of a private type in a public API. （公共API中使用私有类型无效）
  @override
  State<KYMainPage> createState() => _KYMainPageState();
}

class _KYMainPageState extends State<KYMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 四个 tab 对应的控制器
      body: IndexedStack(
        // 当前选中
        index: _currentIndex,
        // 控制器s
        children: [
          KYHome(),
          KYSubject(),
          KYSubject(),
          KYSubject()
        ],
      ),
      // 状态栏
      bottomNavigationBar: BottomNavigationBar(
        // 当前选中
        currentIndex: _currentIndex,
        // 
        type: BottomNavigationBarType.fixed,
        // 点击事件
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 切换 tab
          });
        },
        // 四个 tab 的样式
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            label: "news",
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            label: "top",
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            label: "mine",
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled)
          )
        ],
      ),
    );
  }
}