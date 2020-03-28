import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  // 列表数据源
  final List<String> items;

  const MyListView({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = 'Flutter 长列表组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListViewCell('item+$index');
          },
        ),
      ),
    );
  }
}

// 自定义列表的子视图
class ListViewCell extends ListTile {
  final String name;

  ListViewCell(this.name);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(
          Icons.local_offer,
          size: 20.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
