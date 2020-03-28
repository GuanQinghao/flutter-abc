import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 轻量提示组件示例';

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
        body: Center(
          child: Text(
            'SnackBar 示例',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
        ),
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('显示 SnackBar'),
              ));
            },
            child: Icon(Icons.add),
            shape: CircleBorder(),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
