import 'package:flutter/material.dart';

class My0x8StackAligmentLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x8StackAligmentLayout({Key key, this.title}) : super(key: key);

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
          child: Stack(
            // 子组件左上角对齐
            alignment: Alignment.topLeft,
            children: <Widget>[
              // 底部添加一个头像
              CircleAvatar(
                backgroundImage: AssetImage('images/07.jpeg'),
                radius: 90.0,
              ),

              // 加一个容器，容器里放一个文本
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                ),
                child: Text(
                  '美女',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
