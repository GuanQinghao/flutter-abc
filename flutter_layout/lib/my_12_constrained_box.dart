import 'package:flutter/material.dart';

class My12ConstrainedBoxLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My12ConstrainedBoxLayout({Key key, this.title}) : super(key: key);

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
        body: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 50.0,
            minHeight: 50.0,
            maxWidth: 120.0,
            maxHeight: 120.0,
          ),
          child: Image.asset('images/04.jpeg'),
        ),
      ),
    );
  }
}
