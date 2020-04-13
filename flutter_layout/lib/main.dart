import 'package:flutter/material.dart';
import 'package:flutter_layout/my_0x1_container.dart';
import 'package:flutter_layout/my_0x2_center.dart';
import 'package:flutter_layout/my_0x3_padding.dart';
import 'package:flutter_layout/my_0x4_align.dart';
import 'package:flutter_layout/my_0x5_row.dart';
import 'package:flutter_layout/my_0x6_column.dart';
import 'package:flutter_layout/my_0x7_fitted_box.dart';
import 'package:flutter_layout/my_0x8_stack_aligment.dart';
import 'package:flutter_layout/my_0x9_stack_positioned.dart';
import 'package:flutter_layout/my_0xa_indexed_stack.dart';
import 'package:flutter_layout/my_0xb_overflow_box.dart';
import 'package:flutter_layout/my_11_sized_box.dart';
import 'package:flutter_layout/my_12_constrained_box.dart';
import 'package:flutter_layout/my_13_limited_box.dart';
import 'package:flutter_layout/my_14_aspect_ratio.dart';
import 'package:flutter_layout/my_15_fractionally_sized_box.dart';
import 'package:flutter_layout/my_21_list_view.dart';
import 'package:flutter_layout/my_22_grid_view.dart';
import 'package:flutter_layout/my_23_table_view.dart';
import 'package:flutter_layout/my_31_transform.dart';
import 'package:flutter_layout/my_32_baseline.dart';
import 'package:flutter_layout/my_33_offstage.dart';
import 'package:flutter_layout/my_34_wrap.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  // 数据源
  final List<PageGroup> groups = [
    PageGroup(
      title: '基础布局',
      items: [
        PageItem('Container 容器布局', '/01'),
        PageItem('Center 居中布局', '/02'),
        PageItem('Padding 填充布局', '/03'),
        PageItem('Align 对齐布局', '/04'),
        PageItem('Row 水平布局', '/05'),
        PageItem('Column 垂直布局', '/06'),
        PageItem('FittedBox 缩放布局', '/07'),
        PageItem('Stack/Alignment 层叠布局', '/08'),
        PageItem('Stack/Positioned 层叠布局', '/09'),
        PageItem('IndexedStack 布局', '/0a'),
        PageItem('OverflowBox 溢出父容器显示布局', '/0b'),
      ],
    ),
    PageGroup(
      title: '宽高尺寸布局',
      items: [
        PageItem('SizedBox 设置具体尺寸布局', '/11'),
        PageItem('ConstrainedBox 限定最大最小宽高布局', '/12'),
        PageItem('LimitedBox 限定最大宽高布局', '/13'),
        PageItem('AspectRatio 调整宽高比布局', '/14'),
        PageItem('FractionallySizedBox 百分比布局', '/15'),
      ],
    ),
    PageGroup(
      title: '列表及表格布局',
      items: [
        PageItem('ListView 列表布局', '/21'),
        PageItem('GridView 网格布局', '/22'),
        PageItem('Table 表格布局', '/23'),
      ],
    ),
    PageGroup(
      title: '其他布局',
      items: [
        PageItem('Transform 矩阵转换布局', '/31'),
        PageItem('Baseline 基准线布局', '/32'),
        PageItem('Offstage 显示/隐藏布局', '/33'),
        PageItem('Wrap 按宽高自动换行布局', '/34'),
      ],
    ),
    PageGroup(
      title: '布局综合示例',
      items: [
        PageItem('布局综合示例', '/41'),
      ],
    ),
  ];
  // 路由
  final Map<String, WidgetBuilder> routes = {
    '/01': (BuildContext context) =>
        My0x1ContainerLayout(title: 'Container 容器布局'),
    '/02': (BuildContext context) => My0x2CenterLayout(title: 'Center 居中布局'),
    '/03': (BuildContext context) => My0x3PaddingLayout(title: 'Padding 填充布局'),
    '/04': (BuildContext context) => My0x4AlignLayout(title: 'Align 对齐布局'),
    '/05': (BuildContext context) => My0x5RowLayout(title: 'Row 水平布局'),
    '/06': (BuildContext context) => My0x6ColumnLayout(title: 'Column 垂直布局'),
    '/07': (BuildContext context) =>
        My0x7FittedBoxLayout(title: 'FittedBox 缩放布局'),
    '/08': (BuildContext context) =>
        My0x8StackAligmentLayout(title: 'Stack/Alignment 层叠布局'),
    '/09': (BuildContext context) =>
        My0x9StackPositionedLayout(title: 'Stack/Positioned 层叠布局'),
    '/0a': (BuildContext context) =>
        My0xaIndexedStackLayout(title: 'IndexedStack 布局'),
    '/0b': (BuildContext context) =>
        My0xbOverflowBoxLayout(title: 'OverflowBox 溢出父容器显示布局'),
    '/11': (BuildContext context) =>
        My11SizedBoxLayout(title: 'SizedBox 设置具体尺寸布局'),
    '/12': (BuildContext context) =>
        My12ConstrainedBoxLayout(title: 'ConstrainedBox 限定最大最小宽高布局'),
    '/13': (BuildContext context) =>
        My13LimitedBoxLayout(title: 'LimitedBox 限定最大宽高布局'),
    '/14': (BuildContext context) =>
        My14AspectRatioLayout(title: 'AspectRatio 调整宽高比布局'),
    '/15': (BuildContext context) =>
        My15FractionallySizedBoxLayout(title: 'FractionallySizedBox 百分比布局'),
    '/21': (BuildContext context) => My21ListViewLayout(title: 'ListView 列表布局'),
    '/22': (BuildContext context) => My22GridViewLayout(title: 'GridView 网格布局'),
    '/23': (BuildContext context) => My23TableViewLayout(title: 'Table 表格布局'),
    '/31': (BuildContext context) =>
        My31TransformLayout(title: 'Transform 矩阵转换布局'),
    '/32': (BuildContext context) =>
        My32BaselineLayout(title: 'Baseline 基准线布局'),
    '/33': (BuildContext context) =>
        My33OffstageLayout(title: 'Offstage 显示/隐藏布局'),
    '/34': (BuildContext context) => My34WrapLayout(title: 'Wrap 按宽高自动换行布局'),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 页面布局学习示例',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // 注册路由
      routes: routes,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 页面布局学习示例'),
        ),
        body: MyLayoutExpansionPanel(
          groups: groups,
        ),
      ),
    );
  }
}

// 页面组
class PageGroup {
  String title;
  List<PageItem> items;
  bool isExpanded;

  PageGroup({
    this.title,
    this.items,
    this.isExpanded = false,
  });
}

// 页面项
class PageItem {
  String title;
  String route;

  PageItem(
    this.title,
    this.route,
  );
}

class MyLayoutExpansionPanel extends StatefulWidget {
  final List<PageGroup> groups;

  const MyLayoutExpansionPanel({Key key, @required this.groups})
      : super(key: key);

  @override
  _MyLayoutExpansionPanelState createState() =>
      _MyLayoutExpansionPanelState(groups);
}

class _MyLayoutExpansionPanelState extends State<MyLayoutExpansionPanel> {
  final List<PageGroup> _groups;

  _MyLayoutExpansionPanelState(this._groups);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // .radio 可以实现只展开一组数据
        child: ExpansionPanelList.radio(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _groups[index].isExpanded = !isExpanded;
            });
          },
          children: _groups.map<ExpansionPanel>((PageGroup item) {
            List<PageItem> items = item.items;

            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: item.title,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.title),
                );
              },
              body: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // 数据个数
                  itemCount: items.length,
                  // 构建列表的子视图
                  itemBuilder: (context, index) {
                    // 页面项
                    PageItem item = items[index];
                    // 标题
                    String title = item.title;
                    // 路由-> 跳转页面
                    String route = item.route;

                    return ListTile(
                      leading: Icon(Icons.crop_square),
                      title: Text('$title'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '$route');
                      },
                    );
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
