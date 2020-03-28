import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 抽屉组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Scaffold(
          appBar: AppBar(title: Text(title)),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('用户名'),
                  accountEmail: Text('用户邮箱'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.jpeg'),
                  ),
                  onDetailsPressed: () {},
                  otherAccountsPictures: <Widget>[
                    Container(
                      child: Image.asset('images/qr.png'),
                    ),
                  ],
                ),
                ListTile(
                  title: Text('个性装扮'),
                  leading: CircleAvatar(
                    child: Icon(Icons.color_lens),
                  ),
                ),
                ListTile(
                  title: Text('我的相册'),
                  leading: CircleAvatar(
                    child: Icon(Icons.photo),
                  ),
                ),
                ListTile(
                  title: Text('免流量特权'),
                  leading: CircleAvatar(
                    child: Icon(Icons.wifi),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
