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
      body: Container(),
    );
  }
}
