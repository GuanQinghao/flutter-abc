import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final String title = 'Flutter 悬浮按钮组件示例';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
            title,
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
        ),
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: '请点击 FloatingActionButton',
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            elevation: 7.0,
            highlightElevation: 14.0,
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('你点击了 FloatingActionButton')),
              );
            },
            mini: false,
            shape: CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
