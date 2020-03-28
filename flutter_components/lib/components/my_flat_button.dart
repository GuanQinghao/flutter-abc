import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 扁平按钮示例';

    return MaterialApp(
      title: title,
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
          child: FlatButton(
            color: Colors.lightBlue,
            onPressed: () {
              print('点击按钮。');
            },
            child: Text(
              '扁平按钮',
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
