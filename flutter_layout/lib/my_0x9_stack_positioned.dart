import 'package:flutter/material.dart';

class My0x9StackPositionedLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x9StackPositionedLayout({Key key, this.title}) : super(key: key);

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
            children: <Widget>[
              // 添加图片
              Image.asset('images/04.jpeg'),
              // 设置定位布局
              Positioned(
                child: Text(
                  '可爱',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                left: 12.0,
                top: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
