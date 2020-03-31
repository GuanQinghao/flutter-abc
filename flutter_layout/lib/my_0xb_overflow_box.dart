import 'package:flutter/material.dart';

class My0xbOverflowBoxLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0xbOverflowBoxLayout({Key key, this.title}) : super(key: key);

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
        body: Container(
          color: Colors.green,
          width: 100.0,
          height: 100.0,
          padding: EdgeInsets.all(20.0),
          child: OverflowBox(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 150.0,
            ),
            alignment: Alignment.topLeft,
            maxWidth: 300.0,
            maxHeight: 300.0,
          ),
        ),
      ),
    );
  }
}
