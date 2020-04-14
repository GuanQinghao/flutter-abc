import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/common/search_bar.dart';

class Department extends StatefulWidget {
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  // 选中的一级分类的索引值, 默认0
  int departmentIndex = 0;
  // 一级分类
  List<String> _departments = [
    '推荐专区',
    '爆品专区',
    '新品专区',
    '居家生活',
    '服饰鞋包',
    '酒水饮料',
    '个护清洁',
    '母婴用品',
    '运动旅行',
    '数码家电',
    '电脑办公',
  ];

  // 二级分类的广告图片
  List<String> departmentImages = [
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1725340245,2397117074&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1726933927,2950134446&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2160833135,373948817&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2222003031,2926063847&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1785672595,3071462257&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2170392839,574547165&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1530953590,3104014606&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1512995945,949670399&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2549235676,2541656988&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1098255912,893638375&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1558734614,2571467604&fm=26&gp=0.jpg',
  ];

  // 二级分类
  List data = [
    {
      'title': '休闲零食',
      'data': [
        {
          'image':
              'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1174019095,4181335453&fm=15&gp=0.jpg',
          'title': '饼干高点',
        },
        {
          'image': '',
          'title': '糖果',
        },
        {
          'image': '',
          'title': '肉类零食',
        },
        {
          'image': '',
          'title': '薯条饼干',
        },
      ],
      'title': '冲调饮料',
      'data': [
        {
          'image':
              'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1174019095,4181335453&fm=15&gp=0.jpg',
          'title': '冲调饮品',
        },
        {
          'image': '',
          'title': '绿茶',
        },
        {
          'image': '',
          'title': '花茶',
        },
        {
          'image': '',
          'title': '茉莉茶',
        },
        {
          'image': '',
          'title': '红茶',
        },
        {
          'image': '',
          'title': '白茶',
        },
        {
          'image': '',
          'title': '黑茶',
        },
        {
          'image': '',
          'title': '其他',
        },
      ],
      'title': '热门品牌',
      'data': [
        {
          'image':
              'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1174019095,4181335453&fm=15&gp=0.jpg',
          'title': '5G手机',
        },
        {
          'image': '',
          'title': '游戏手机',
        },
        {
          'image': '',
          'title': '拍照手机',
        },
        {
          'image': '',
          'title': '老人机',
        },
        {
          'image': '',
          'title': '学生机',
        },
      ],
    },
  ];

  // 初始化
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  // 销毁
  @override
  void dispose() {
    super.dispose();
  }

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
              color: Color(0xFFEEEEEE),
              child: ListView.builder(
                itemCount: _departments.length,
                itemBuilder: (BuildContext context, int index) {
                  // 一级分类名称
                  String department = _departments[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        departmentIndex = (departmentIndex == index)
                            ? departmentIndex
                            : index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      color: (index == departmentIndex)
                          ? Colors.white
                          : Colors.transparent,
                      height: 56.0,
                      child: Center(
                        child: Text(
                          department,
                          style: TextStyle(
                            fontSize: (index == departmentIndex) ? 14.0 : 13.0,
                            fontWeight: (index == departmentIndex)
                                ? FontWeight.w500
                                : FontWeight.bold,
                            color: (index == departmentIndex)
                                ? Color(0xFFFF463C)
                                : Color(0xFF1C1C1D),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: <Widget>[
                    // 二级分类图片
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Image.network(
                          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1725340245,2397117074&fm=26&gp=0.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // 二级分类列表
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          // 二级分类数量
                          int _count = 10;
                          // 每行个数
                          int _rowCount = 3;
                          // 每行高度固定
                          double _rowHeight = 115.0;
                          // 单个宽度
                          double _width =
                              (MediaQuery.of(context).size.width - 120.0) / 3;
                          // 单个宽高比
                          double ratio = _width / _rowHeight;

                          return Container(
                            padding: EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                            ),
                            child: Column(
                              children: <Widget>[
                                // 二级分类标题
                                Container(
                                  height: 35.0,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '标题',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1C1C1D),
                                    ),
                                  ),
                                ),
                                // 二级分类标题下的分割线
                                Divider(
                                  height: 1.0,
                                  color: Color(0xFFEAEAEA),
                                ),
                                // 二级分类网格列表
                                Container(
                                  height:
                                      _rowHeight * (_count ~/ _rowCount + 1),
                                  margin: EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15.0,
                                  ),
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _rowCount,
                                      childAspectRatio: ratio,
                                    ),
                                    itemCount: _count,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                          top: 10.0,
                                          bottom: 10.0,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Image.network(
                                              'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1725340245,2397117074&fm=26&gp=0.jpg',
                                              width: 60.0,
                                              height: 60.0,
                                              fit: BoxFit.fill,
                                            ),
                                            Divider(
                                                height: 10.0,
                                                color: Colors.transparent),
                                            Container(
                                              height: 15.0,
                                              child: Text(
                                                '肉类零食',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color(0xFF1C1C1D),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
