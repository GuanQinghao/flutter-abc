import 'package:flutter/material.dart';

class My0xaIndexedStackLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0xaIndexedStackLayout({Key key, this.title}) : super(key: key);

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
          child: IndexedStack(
            // 设置索引值为1就只显示文本内容
            index: 1,
            alignment: FractionalOffset(0.2, 0.2),
            children: <Widget>[
              // 添加图片, 索引值为0
              Image.asset('images/04.jpeg'),
              // 加一个容器,容器里放一个文本, 索引值为1
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
