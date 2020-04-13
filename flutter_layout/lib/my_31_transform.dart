import 'package:flutter/material.dart';

class My31TransformLayout extends StatefulWidget {
  // 导航栏标题
  final String title;

  const My31TransformLayout({Key key, this.title}) : super(key: key);

  @override
  _My31TransformLayoutState createState() => _My31TransformLayoutState(title);
}

class _My31TransformLayoutState extends State<My31TransformLayout> {
  // 导航栏标题
  final String title;

  _My31TransformLayoutState(this.title);

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
          child: Container(
            color: Colors.grey,
            child: Transform(
              transform: Matrix4.rotationZ(0.3),
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Color(0xFFE8581C),
                child: Text('Transform 矩阵转换'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
