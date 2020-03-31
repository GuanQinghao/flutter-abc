import 'package:flutter/material.dart';

class My11SizedBoxLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My11SizedBoxLayout({Key key, this.title}) : super(key: key);

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
        body: SizedBox(
          width: 200.0,
          height: 300.0,
          child: const Card(
            child: Text(
              'SizedBox',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
