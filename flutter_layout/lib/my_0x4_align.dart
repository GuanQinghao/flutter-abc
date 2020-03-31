import 'package:flutter/material.dart';

class My0x4AlignLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x4AlignLayout({Key key, this.title}) : super(key: key);

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
        body: Stack(
          children: <Widget>[
            // 左上角
            Align(
              alignment: FractionalOffset(0.0, 0.0),
              child: Image.asset(
                'images/11.jpeg',
                width: 180.0,
                height: 180.0,
              ),
            ),
            // 右上角
            Align(
              alignment: FractionalOffset(1.0, 0.0),
              child: Image.asset(
                'images/10.jpeg',
                width: 180.0,
                height: 180.0,
              ),
            ),
            // 水平垂直放向居中
            Align(
              alignment: FractionalOffset.center,
              child: Image.asset(
                'images/09.jpeg',
                width: 180.0,
                height: 180.0,
              ),
            ),
            //左下角
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: Image.asset(
                'images/08.jpeg',
                width: 180.0,
                height: 180.0,
              ),
            ),
            // 右下角
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Image.asset(
                'images/07.jpeg',
                width: 180.0,
                height: 180.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
