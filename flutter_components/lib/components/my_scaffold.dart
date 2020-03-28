import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 脚手架组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
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
        body: Center(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            color: Colors.grey[300],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: '增加',
          child: Icon(
            Icons.add,
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
