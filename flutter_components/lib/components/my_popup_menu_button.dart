import 'package:flutter/material.dart';

enum ConferenceItem { AddMember, LockConference, ModifyLayout, TurnOffAll }

class MyPopupMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Flutter 弹出菜单按钮组件示例';

    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
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
          child: FlatButton(
            onPressed: () {},
            child: PopupMenuButton<ConferenceItem>(
              onSelected: (ConferenceItem result) {},
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<ConferenceItem>>[
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.AddMember,
                  child: Text('添加成员'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.LockConference,
                  child: Text('锁定会议'),
                ),
                const PopupMenuItem(
                  value: ConferenceItem.ModifyLayout,
                  child: Text('修改布局'),
                ),
                const PopupMenuItem(
                  value: ConferenceItem.TurnOffAll,
                  child: Text('挂断所有'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
