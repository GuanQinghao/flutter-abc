import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 卡片组件示例';

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
        ),
        body: Center(
          child: SizedBox(
            height: 250.0,
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('陕西省西安市雁塔区'),
                    subtitle: Text('XXX科技有限公司'),
                    leading: Icon(Icons.home, color: Colors.lightBlue),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('陕西省西安市高新区'),
                    subtitle: Text('XXX股份有限公司'),
                    leading: Icon(Icons.school, color: Colors.lightBlue),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
