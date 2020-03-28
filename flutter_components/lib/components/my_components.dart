import 'package:flutter/material.dart';

class MyComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 常用组件示例';

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
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          reverse: false,
          children: <Widget>[
            Container(
              // color属性和decoration属性冲突
              // color: Colors.blueGrey,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              width: 200.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: new Border.all(
                  color: Colors.grey,
                  width: 8.0,
                ),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
              ),
              child: Text(
                'Container 组件',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28.0, backgroundColor: Colors.red),
              ),
            ),
            Container(
              width: 300.0,
              height: 100.0,
              color: Colors.lightGreen,
              child: Image.network(
                'https://pic1.zhimg.com/v2-3b4fc7e3a1195a081d0259246c38debc_1200x500.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Text(
              '红色字体+黑色删除线+18号+斜体+粗体',
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.black,
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              '橙色+下划线+24号',
              style: TextStyle(
                color: Colors.orange,
                decoration: TextDecoration.underline,
                fontSize: 24.0,
              ),
            ),
            Text(
              '上划线+虚线+23号',
              style: TextStyle(
                decoration: TextDecoration.overline,
                fontSize: 23.0,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
            Text(
              '23号+斜体+加粗+字间距6',
              style: TextStyle(
                fontSize: 23.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0,
              ),
            ),
            Icon(
              Icons.traffic,
              color: Colors.blue,
              size: 48.0,
              // 语义标签，不会显示在UI上
              semanticLabel: '红绿灯',
            ),
            IconButton(
              color: Colors.blueGrey,
              focusColor: Colors.red,
              splashColor: Colors.redAccent,
              disabledColor: Colors.green,
              hoverColor: Colors.purple,
              iconSize: 96.0,
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.done,
                color: Colors.yellow,
                size: 96.0,
              ),
              tooltip: '确定',
              onPressed: () {
                print('点击按钮');
              },
            ),
            RaisedButton(
              color: Colors.lightGreen,
              disabledColor: Colors.red,
              child: Container(
                alignment: Alignment.centerLeft,
                width: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Text('按钮标题'),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
