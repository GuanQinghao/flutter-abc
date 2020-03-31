import 'package:flutter/material.dart';

class My0x2CenterLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x2CenterLayout({Key key, @required this.title}) : super(key: key);

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
            padding: EdgeInsets.all(10.0),
            color: Colors.red[300],
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blue[100],
      ),
    );
  }
}
