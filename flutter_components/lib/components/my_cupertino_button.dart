import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter Cupertino对话框组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: FlatButton(
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: CupertinoButton(
            child: Text(title),
            color: Colors.blue,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
