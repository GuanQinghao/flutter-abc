import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 文本框组件示例';

    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print('你输入的内容为: ${controller.text}');
    });

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
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: controller,
              maxLength: 30,
              maxLines: 1,
              autocorrect: true,
              obscureText: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.green,
              ),
              onChanged: (text) {
                print('文本内容改变时回调 $text');
              },
              onSubmitted: (text) {
                print('内容提交时回调 $text');
              },
              enabled: true,
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                helperText: '用户名',
                prefixIcon: Icon(Icons.person),
                suffixText: '用户名',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
