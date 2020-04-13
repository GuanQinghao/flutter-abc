import 'package:flutter/material.dart';

class My34WrapLayout extends StatefulWidget {
  // 导航栏标题
  final String title;

  const My34WrapLayout({Key key, this.title}) : super(key: key);

  @override
  _My34WrapLayoutState createState() => _My34WrapLayoutState(title);
}

class _My34WrapLayoutState extends State<My34WrapLayout> {
  // 导航栏标题
  final String title;

  _My34WrapLayoutState(this.title);

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
        body: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: <Widget>[
            Chip(
              label: Text(
                '西门吹雪',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '西门',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '东方不败',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '东方',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '张无忌',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '张',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '乔峰',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '乔',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '西门吹雪',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '西门',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '西门吹雪',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '西门',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '西门吹雪',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '西门',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
            Chip(
              label: Text(
                '西门吹雪',
              ),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800,
                child: Text(
                  '西门',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
