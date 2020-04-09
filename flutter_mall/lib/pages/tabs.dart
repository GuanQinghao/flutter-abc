import 'package:flutter/material.dart';

import 'cart/cart.dart';
import 'department/department.dart';
import 'home/home.dart';
import 'me/me.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // 选中的索引值
  int _index = 0;
  // tabs对应页面
  final List<Widget> _items = [
    Home(),
    Department(),
    Cart(),
    Me(),
  ];

  // 点击事件
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items[_index],
      bottomNavigationBar: BottomNavigationBar(
        // 选中字体大小
        selectedFontSize: 12.0,
        // 未选中字体大小
        unselectedFontSize: 12.0,
        // item
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,

        // 点击动画
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
