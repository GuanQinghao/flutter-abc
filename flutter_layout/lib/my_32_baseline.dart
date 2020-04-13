import 'package:flutter/material.dart';

class My32BaselineLayout extends StatefulWidget {
  // 导航栏标题
  final String title;

  const My32BaselineLayout({Key key, this.title}) : super(key: key);

  @override
  _My32BaselineLayoutState createState() => _My32BaselineLayoutState(title);
}

class _My32BaselineLayoutState extends State<My32BaselineLayout> {
  // 导航栏标题
  final String title;

  _My32BaselineLayoutState(this.title);

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Baseline(
              baseline: 80.0,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                'AaBbCcDd',
                style: TextStyle(
                  fontSize: 10,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
            Baseline(
              baseline: 80.0,
              baselineType: TextBaseline.alphabetic,
              child: Container(
                width: 40.0,
                height: 40.0,
                color: Colors.green,
              ),
            ),
            Baseline(
              baseline: 80.0,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                'AaBbCcDd',
                style: TextStyle(
                  fontSize: 26.0,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
