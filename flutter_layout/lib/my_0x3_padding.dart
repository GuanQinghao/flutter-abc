import 'package:flutter/material.dart';

class My0x3PaddingLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x3PaddingLayout({Key key, this.title}) : super(key: key);

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
            width: 300.0,
            height: 300.0,
            padding: EdgeInsets.all(60.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 8.0,
              ),
            ),
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 8.0,
                ),
              ),
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }
}
