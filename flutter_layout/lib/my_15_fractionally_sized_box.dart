import 'package:flutter/material.dart';

class My15FractionallySizedBoxLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My15FractionallySizedBoxLayout({Key key, this.title}) : super(key: key);

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
          color: Colors.blueGrey,
          height: 200.0,
          width: 200.0,
          child: FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: 0.6,
            heightFactor: 1.2,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
