import 'package:flutter/material.dart';

class My13LimitedBoxLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My13LimitedBoxLayout({Key key, this.title}) : super(key: key);

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
        body: Row(
          children: <Widget>[
            Container(
              width: 100.0,
              color: Colors.grey,
            ),
            Divider(
              thickness: 10.0,
              color: Colors.white,
            ),
            LimitedBox(
              maxWidth: 200.0,
              child: Container(
                width: 300.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
