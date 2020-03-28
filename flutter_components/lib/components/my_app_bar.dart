import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter AppBar示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: FlatButton(
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => print('点击搜索按钮'),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => print('点击添加按钮'),
            )
          ],
        ),
      ),
    );
  }
}
