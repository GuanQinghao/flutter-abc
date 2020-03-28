import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter Cupertino导航组件集示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyCupertinoTabPage(),
    );
  }
}

class MyCupertinoTabPage extends StatefulWidget {
  @override
  _MyCupertinoTabPageState createState() => _MyCupertinoTabPageState();
}

class _MyCupertinoTabPageState extends State<MyCupertinoTabPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('主页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            title: Text('聊天'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
                break;
              case 1:
                return ChatPage();
                break;
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}

// 主页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(CupertinoIcons.back),
        middle: Text('主页'),
        trailing: Icon(CupertinoIcons.add),
      ),
      child: Center(
        child: Text(
          '主页',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}

// 聊天面板
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(CupertinoIcons.back),
        middle: Text('聊天'),
        trailing: Icon(CupertinoIcons.add),
      ),
      child: Center(
        child: Text(
          '聊天面板',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
