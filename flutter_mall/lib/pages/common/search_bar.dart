import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/common/toast.dart';

// 搜索栏
class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  // 高度
  final double height;

  const SearchBar({Key key, this.height}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFF463C),
      title: _buildInputTextFieldWidget(),
      leading: _buildScanButton(),
      actions: <Widget>[
        _buildMessageButton(),
      ],
    );
  }

  // 搜索栏上的输入框
  Widget _buildInputTextFieldWidget() {
    return Container(
      // 装饰
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      alignment: Alignment.center,
      height: 32.0,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.grey,
        ),
        child: Container(
          height: 32.0,
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[800],
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
              ),
              hintText: '搜索商品',
              hintMaxLines: 1,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFACACAC),
              ),
              hasFloatingPlaceholder: false,
            ),
          ),
        ),
      ),
    );
  }

  // 搜索栏上的扫一扫按钮
  Widget _buildScanButton() {
    return Container(
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.filter_center_focus,
              color: Colors.white,
            ),
            Text(
              '扫一扫',
              maxLines: 1,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: () {
          Toast.toast(context, '点击扫一扫按钮');
          print(context);
        },
      ),
    );
  }

  // 搜索栏上的消息按钮
  Widget _buildMessageButton() {
    return Container(
      width: 56.0,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.message,
              color: Colors.white,
            ),
            Text(
              '消息',
              maxLines: 1,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: () {
          Toast.toast(context, '点击扫一扫按钮');
          print(context);
        },
      ),
    );
  }
}
