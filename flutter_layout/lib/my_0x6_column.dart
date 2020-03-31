import 'package:flutter/material.dart';

class My0x6ColumnLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x6ColumnLayout({Key key, this.title}) : super(key: key);

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.red,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.verified_user,
              color: Colors.blue,
              size: 44.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
