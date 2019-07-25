import 'package:flutter/material.dart';

// 创建一个 Icon 展示控件
class NavigationIconView {

  // 创建两个属性，一个是 用来展示 icon， 一个是动画处理
  final BottomNavigationBarItem item;
  final AnimationController controller;

  // 类似于 java 中的构造方法
  // 创建 NavigationIconView 需要传入三个参数， icon 图标，title 标题， TickerProvider
  NavigationIconView({Widget icon, Widget title, TickerProvider vsync}):
        item = new BottomNavigationBarItem(
          icon: icon,
          title: title,
        ),
        controller = new AnimationController(
            duration: kThemeAnimationDuration,    // 设置动画持续的时间
            vsync: vsync                          // 默认属性和参数
        );
}