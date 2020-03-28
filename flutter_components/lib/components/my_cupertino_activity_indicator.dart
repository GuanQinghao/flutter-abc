import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoActivityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter Cupertino加载指示器组件示例';

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
          child: CupertinoActivityIndicator(
            radius: 30.0,
          ),
        ),
      ),
    );
  }
}
