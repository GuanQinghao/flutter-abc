import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'Flutter 网格列表组件示例';
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: EdgeInsets.all(8.0),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 4,
          children: widgetItemList(),
        ),
      ),
    );
  }
}

// 数据源
List<String> dataSource() {
  List<String> items = [];
  for (var i = 0; i < 500; i++) {
    items.add('Item $i');
  }
  return items;
}

// 组件源
List<Widget> widgetItemList() {
  return dataSource().map((item) => widgetItemContainer(item)).toList();
}

Widget widgetItemContainer(String item) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      item,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
    color: Colors.blue[600],
  );
}
