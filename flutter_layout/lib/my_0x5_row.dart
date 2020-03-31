import 'package:flutter/material.dart';

class My0x5RowLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My0x5RowLayout({Key key, this.title}) : super(key: key);

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
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.update,
                  color: Colors.yellow,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
