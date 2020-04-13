import 'package:flutter/material.dart';

class My33OffstageLayout extends StatefulWidget {
  // 导航栏标题
  final String title;

  const My33OffstageLayout({Key key, this.title}) : super(key: key);

  @override
  _My33OffstageLayoutState createState() => _My33OffstageLayoutState(title);
}

class _My33OffstageLayoutState extends State<My33OffstageLayout> {
  // 导航栏标题
  final String title;
  // 是否显示组件
  bool offstage = true;

  _My33OffstageLayoutState(this.title);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Offstage(
            offstage: offstage,
            child: Text(
              '显示或隐藏文本',
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              offstage = !offstage;
            });
          },
          tooltip: '显示隐藏',
          child: Icon(Icons.flip),
        ),
      ),
    );
  }
}
