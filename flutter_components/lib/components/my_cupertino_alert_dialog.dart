import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoAlertDialog extends StatelessWidget {
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
          child: CupertinoAlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除？'),
                  Text('一旦删除数据不可恢复!'),
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('确定'),
                onPressed: () {
                  print('点击确定按钮');
                },
              ),
              CupertinoDialogAction(
                child: Text('取消'),
                onPressed: () {
                  print('点击取消按钮');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
