import 'package:flutter/material.dart';

class My22GridViewLayout extends StatefulWidget {
  // 导航栏标题
  final String title;

  const My22GridViewLayout({Key key, this.title}) : super(key: key);

  @override
  _My22GridViewLayoutState createState() => _My22GridViewLayoutState(title);
}

class _My22GridViewLayoutState extends State<My22GridViewLayout> {
  // 导航栏标题
  final String title;

  _My22GridViewLayoutState(this.title);

  List<Container> _buildGridTitleList(int count) {
    return List<Container>.generate(
      count,
      (int index) => Container(
          child: Image.asset(
        'images/0${index + 1}.jpeg',
      )),
    );
  }

  Widget buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTitleList(9),
    );
  }

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
          child: buildGrid(),
        ),
      ),
    );
  }
}
