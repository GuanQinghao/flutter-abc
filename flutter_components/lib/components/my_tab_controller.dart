import 'package:flutter/material.dart';

class ItemView {
  final String title;
  final IconData icon;

  const ItemView(this.title, this.icon);
}

const List<ItemView> items = <ItemView>[
  const ItemView('自驾', Icons.directions_car),
  const ItemView('自行车', Icons.directions_bike),
  const ItemView('轮船', Icons.directions_boat),
  const ItemView('公交车', Icons.directions_bus),
  const ItemView('火车', Icons.directions_railway),
  const ItemView('步行', Icons.directions_walk),
];

class MyTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 水平选项卡组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        length: items.length,
        child: Scaffold(
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
            bottom: TabBar(
              isScrollable: true,
              tabs: items.map(
                (ItemView item) {
                  return Tab(
                    text: item.title,
                    icon: Icon(item.icon),
                  );
                },
              ).toList(),
            ),
          ),
          body: TabBarView(
              children: items.map(
            (ItemView item) {
              return SelectedTabView(item: item);
            },
          ).toList()),
        ),
      ),
    );
  }
}

class SelectedTabView extends StatelessWidget {
  final ItemView item;

  const SelectedTabView({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;

    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              item.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            Text(
              item.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
