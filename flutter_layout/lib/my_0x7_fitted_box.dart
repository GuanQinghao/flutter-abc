import 'package:flutter/material.dart';

class My0x7FittedBoxLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x7FittedBoxLayout({Key key, this.title}) : super(key: key);

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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.none,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.white,
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Image.asset('images/08.jpeg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
