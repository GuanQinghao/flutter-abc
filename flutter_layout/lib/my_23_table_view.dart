import 'package:flutter/material.dart';

class My23TableViewLayout extends StatefulWidget {
  // 导航栏标题
  final String title;

  const My23TableViewLayout({Key key, this.title}) : super(key: key);

  @override
  _My23TableViewLayoutState createState() => _My23TableViewLayoutState(title);
}

class _My23TableViewLayoutState extends State<My23TableViewLayout> {
  // 导航栏标题
  final String title;

  _My23TableViewLayoutState(this.title);

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
          child: Table(
            columnWidths: <int, TableColumnWidth>{
              0: FixedColumnWidth(100.0),
              1: FixedColumnWidth(40.0),
              2: FixedColumnWidth(80.0),
              3: FixedColumnWidth(80.0),
            },
            border: TableBorder.all(
              color: Colors.black38,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            children: const <TableRow>[
              TableRow(
                children: <Widget>[
                  Text('姓名'),
                  Text('性别'),
                  Text('年龄'),
                  Text('身高'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Text('张三'),
                  Text('男'),
                  Text('26'),
                  Text('172'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Text('李四'),
                  Text('男'),
                  Text('28'),
                  Text('178'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
