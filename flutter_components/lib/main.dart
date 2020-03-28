import 'package:flutter/material.dart';
import 'package:flutter_components/components/my_alert_dialog.dart';
import 'package:flutter_components/components/my_app_bar.dart';
import 'package:flutter_components/components/my_bottom_navigation_bar.dart';
import 'package:flutter_components/components/my_card.dart';
import 'package:flutter_components/components/my_components.dart';
import 'package:flutter_components/components/my_cupertino_activity_indicator.dart';
import 'package:flutter_components/components/my_cupertino_alert_dialog.dart';
import 'package:flutter_components/components/my_cupertino_button.dart';
import 'package:flutter_components/components/my_cupertino_tab.dart';
import 'package:flutter_components/components/my_drawer.dart';
import 'package:flutter_components/components/my_flat_button.dart';
import 'package:flutter_components/components/my_floating_action_button.dart';
import 'package:flutter_components/components/my_form.dart';
import 'package:flutter_components/components/my_grid_view.dart';
import 'package:flutter_components/components/my_list_view.dart';
import 'package:flutter_components/components/my_popup_menu_button.dart';
import 'package:flutter_components/components/my_scaffold.dart';
import 'package:flutter_components/components/my_simple_dialog.dart';
import 'package:flutter_components/components/my_snack_bar.dart';
import 'package:flutter_components/components/my_tab_controller.dart';
import 'package:flutter_components/components/my_text_field.dart';

// Flutter 学习示例
void main() => runApp(MyHomePage(
      // 数据源
      myItems: [
        {'title': '提示对话框组件', 'route': '/1'},
        {'title': 'AppBar组件', 'route': '/2'},
        {'title': '底部导航栏组件', 'route': '/3'},
        {'title': '卡片组件', 'route': '/4'},
        {'title': '常用组件', 'route': '/5'},
        {'title': '抽屉组件', 'route': '/6'},
        {'title': '扁平按钮组件', 'route': '/7'},
        {'title': '悬停按钮组件', 'route': '/8'},
        {'title': '表单组件', 'route': '/9'},
        {'title': '长列表组件', 'route': '/10'},
        {'title': '网格组件', 'route': '/11'},
        {'title': '弹出菜单按钮组件', 'route': '/12'},
        {'title': '脚手架组件', 'route': '/13'},
        {'title': '简单对话框组件', 'route': '/14'},
        {'title': '轻量提示组件', 'route': '/15'},
        {'title': '水平选项卡组件', 'route': '/16'},
        {'title': '文本框组件', 'route': '/17'},
        {'title': 'Cupertino加载指示器组件', 'route': '/18'},
        {'title': 'Cupertino对话框组件', 'route': '/19'},
        {'title': 'Cupertino按钮组件', 'route': '/20'},
        {'title': 'Cupertino导航集组件', 'route': '/21'},
      ],
      // 路由数据
      myRoutes: {
        '/1': (BuildContext context) => MyAlertDialog(),
        '/2': (BuildContext context) => MyAppBar(),
        '/3': (BuildContext context) => MyBottomNavigationBar(),
        '/4': (BuildContext context) => MyCard(),
        '/5': (BuildContext context) => MyComponents(),
        '/6': (BuildContext context) => MyDrawer(),
        '/7': (BuildContext context) => MyFlatButton(),
        '/8': (BuildContext context) => MyFloatingActionButton(),
        '/9': (BuildContext context) => MyForm(),
        '/10': (BuildContext context) => MyListView(
              items: List<String>.generate(500, (i) => 'Item $i'),
            ),
        '/11': (BuildContext context) => MyGridView(),
        '/12': (BuildContext context) => MyPopupMenuButton(),
        '/13': (BuildContext context) => MyScaffold(),
        '/14': (BuildContext context) => MySimpleDialog(),
        '/15': (BuildContext context) => MySnackBar(),
        '/16': (BuildContext context) => MyTabController(),
        '/17': (BuildContext context) => MyTextField(),
        '/18': (BuildContext context) => MyCupertinoActivityIndicator(),
        '/19': (BuildContext context) => MyCupertinoAlertDialog(),
        '/20': (BuildContext context) => MyCupertinoButton(),
        '/21': (BuildContext context) => MyCupertinoTabPage(),
      },
    ));

class MyHomePage extends StatelessWidget {
  // 列表视图数据源
  final List<Map> myItems;
  // 页面路由数据
  final Map<String, WidgetBuilder> myRoutes;

  const MyHomePage({Key key, @required this.myItems, @required this.myRoutes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 学习示例',
      routes: myRoutes,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 学习示例'),
        ),
        body: ListView.builder(
          // 数据个数
          itemCount: myItems.length,
          // 构建列表的子视图
          itemBuilder: (context, index) {
            // 数据Map
            Map item = myItems[index];
            // 标题
            String title = item['title'];
            // 路由-> 跳转页面
            String route = item['route'];

            return ListTile(
              leading: Icon(Icons.crop_square),
              title: Text('$title'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '$route');
              },
            );
          },
        ),
      ),
    );
  }
}
