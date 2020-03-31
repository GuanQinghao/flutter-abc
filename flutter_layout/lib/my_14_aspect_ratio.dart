import 'package:flutter/material.dart';

class My14AspectRatioLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My14AspectRatioLayout({Key key, this.title}) : super(key: key);

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
          height: 200.0,
          child: AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
