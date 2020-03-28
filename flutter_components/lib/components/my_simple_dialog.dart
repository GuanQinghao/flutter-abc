import 'package:flutter/material.dart';

class MySimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 简单对话框组件示例';

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
          child: SimpleDialog(
            title: Text('对话框标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {},
                child: Text('第一行信息'),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Text('第二行信息'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
