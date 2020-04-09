import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mall/network.dart';
import 'package:path_provider/path_provider.dart';

import 'widgets/home_ad_widget.dart';
import 'widgets/home_favourite_products_widget.dart';
import 'widgets/home_first_floor_products_widget.dart';
import 'widgets/home_floor_header_widget.dart';
import 'widgets/home_hot_products_widget.dart';
import 'widgets/home_recommend_products_widget.dart';
import 'widgets/home_second_floor_products_widget.dart';
import 'widgets/home_slide_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 滚动控制器
  ScrollController _controller = ScrollController();
  // 是否显示回到顶部按钮
  bool showTopButton = false;

  @override
  void initState() {
    // 重写初始化方法
    super.initState();

    // downloadFile();

    // SharedNetwork().get('/v1/item', query: {
    //   'catId': '1135390837932781569',
    //   'complex': '0',
    //   'complexType': '0',
    //   'current': '1',
    //   'size': '20',
    // });

    SharedNetwork().get(
      '/auth/login',
      query: {
        'password': '111111',
        'username': '18220553699',
      },
      success: (data) {
        print(data['code']);
        print('data' + data.toString());
      },
    );

    // 添加滚动事件监听
    _controller.addListener(
      () {
        // 打印滚动位置
        // print(_controller.offset);

        if (_controller.offset < MediaQuery.of(context).size.height &&
            showTopButton) {
          setState(
            () {
              // 隐藏
              showTopButton = false;
            },
          );
        } else if (_controller.offset >= MediaQuery.of(context).size.height &&
            showTopButton == false) {
          setState(
            () {
              // 显示
              showTopButton = true;
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // 内存释放
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航条
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 7, 53),
        title: _HomeSearchBarWidget(),
        leading: _HomeScanButton(),
        actions: <Widget>[
          _HomeMessageButton(),
        ],
      ),
      body: ListView(
        controller: _controller,
        children: <Widget>[
          // 轮播图
          HomeSlideWidget(),
          // 广告图
          HomeAdWidget(),
          // 秒杀
          HomeRecommendProductsWidget(),
          // 1楼标题
          HomeFloorHeaderWidget(title: '楼层商品1'),
          // 1楼商品
          HomeFirstFloorProductsWidget(),
          // 2楼标题
          HomeFloorHeaderWidget(title: '楼层商品2'),
          // 2楼商品
          HomeSecondFloorProductsWidget(),
          // 热门推荐标题
          HomeFloorHeaderWidget(title: '热门推荐'),
          // 热门推荐
          HomeHotProductsWidget(),
          // 猜你喜欢标题
          HomeFloorHeaderWidget(title: '猜你喜欢'),
          // 猜你喜欢
          HomeFavouriteProductsWidget(),
        ],
      ),

      // 返回顶部按钮
      floatingActionButton: !showTopButton
          ? null
          : FloatingActionButton(
              child: Icon(
                Icons.file_upload,
                color: Colors.red,
                size: 32.0,
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                // 动效返回顶部
                _controller.animateTo(
                  0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
    );
  }
}

// 首页搜索栏
class _HomeSearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                color: Color.fromARGB(255, 173, 173, 173),
              ),
              hasFloatingPlaceholder: false,
            ),
          ),
        ),
      ),
    );
  }
}

// 导航栏上的扫一扫按钮
class _HomeScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
      ),
    );
  }
}

// 导航栏上消息按钮
class _HomeMessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
      ),
    );
  }
}

void downloadFile() async {
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path;
  print('$path');

  SharedNetwork().download(
    'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action@1.0/docs/imgs/book.jpg',
    '${directory.path}/book.jpg',
    success: (data) {
      print(data);
    },
  );
}
