import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/common/search_bar.dart';

class Department extends StatefulWidget {
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        height: 56.0,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 90.0,
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 56.0,
                    child: Text('data' + index.toString()),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: GridView.builder(
                  itemCount: 100,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Text('data' + index.toString()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
