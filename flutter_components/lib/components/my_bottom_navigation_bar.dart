import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 底部导航栏组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: FlatButton(
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: _MyBottomNavigationBar(appBarTitle: title),
      ),
    );
  }
}

class _MyBottomNavigationBar extends StatefulWidget {
  final String appBarTitle;

  const _MyBottomNavigationBar({Key key, @required this.appBarTitle})
      : super(key: key);

  @override
  __MyBottomNavigationBarState createState() =>
      __MyBottomNavigationBarState(appBarTitle);
}

class __MyBottomNavigationBarState extends State<_MyBottomNavigationBar> {
  final String appBarTitle;

  // 选中的索引值
  int _selectedIndex = 1;
  // 选中索引对应数据
  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
    Text('Index 3: 我的'),
  ];

  // 点击事件
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  __MyBottomNavigationBarState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('通讯录'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_circle),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('发现'),
          ),
        ],
        currentIndex: _selectedIndex,
        // fixedColor: Colors.deepOrange,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        onTap: _onItemTapped,
        // 点击动画
        // type: BottomNavigationBarType.fixed,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
      ),
    );
  }
}
