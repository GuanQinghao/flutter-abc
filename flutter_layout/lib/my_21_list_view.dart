import 'package:flutter/material.dart';

class My21ListViewLayout extends StatelessWidget {
  // 导航栏标题
  final String title;

  const My21ListViewLayout({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
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
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('广州市黄埔大道建中路店'),
                subtitle: Text('广州市黄埔大道建中路3号'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
