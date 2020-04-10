import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mall/models/product_model.dart';
import 'package:flutter_mall/pages/common/search_bar.dart';
import 'widgets/home_favourite_products_widget.dart';
import 'widgets/home_first_floor_products_widget.dart';
import 'widgets/home_hot_products_widget.dart';
import 'widgets/home_recommend_products_widget.dart';
import 'widgets/home_second_floor_products_widget.dart';
import 'widgets/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 滚动控制器
  ScrollController _controller = ScrollController();
  // 是否显示回到顶部按钮
  bool showTopButton = false;
  // 商品列表
  List<ProductModel> items;

  @override
  void initState() {
    // 重写初始化方法
    super.initState();

    // 请求参数
    var query = {
      'catId': '1135390837932781569',
      'complex': '0',
      'complexType': '0',
      'current': '1',
      'size': '6',
    };
    // 发起网络请求
    ProductModel().fetchProducts(
      parameters: query,
      success: (List<ProductModel> products) async {
        if (mounted) {
          setState(() {
            items = products;
          });
        }
      },
      fail: () {
        Toast.toast(context, '获取商品列表失败');
      },
    );

    // SharedNetwork().get(
    //   '/auth/login',
    //   query: {
    //     'password': '111111',
    //     'username': '18220553699',
    //   },
    //   success: (data) {
    //     print(data['code']);
    //     print('data' + data.toString());
    //   },
    // );

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
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航条
      appBar: SearchBar(
        height: 56.0,
      ),
      body: ListView(
        controller: _controller,
        children: <Widget>[
          // 轮播图
          _SliderWidget(),
          // 广告图
          _AdvertisingWidget(),
          // 秒杀
          HomeRecommendProductsWidget(),
          // 1楼标题
          _FloorHeaderWidget(
            title: '楼层商品1',
          ),
          // 1楼商品
          HomeFirstFloorProductsWidget(),
          // 2楼标题
          _FloorHeaderWidget(
            title: '楼层商品2',
          ),
          // 2楼商品
          HomeSecondFloorProductsWidget(),
          // 热门推荐标题
          _FloorHeaderWidget(
            title: '热门推荐',
          ),
          // 热门推荐
          HomeHotProductsWidget(
            items: items,
          ),
          // 猜你喜欢标题
          _FloorHeaderWidget(
            title: '猜你喜欢',
          ),
          // 猜你喜欢
          HomeFavouriteProductsWidget(
            items: items,
          ),
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

// // 首页搜索栏
// class _HomeSearchBarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // 装饰
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(16.0),
//         ),
//       ),
//       alignment: Alignment.center,
//       height: 32.0,
//       child: Theme(
//         data: ThemeData(
//           primaryColor: Colors.grey,
//         ),
//         child: Container(
//           height: 32.0,
//           padding: EdgeInsets.only(
//             left: 5.0,
//             right: 5.0,
//           ),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(
//               Radius.circular(16.0),
//             ),
//           ),
//           child: TextField(
//             style: TextStyle(
//               fontSize: 14.0,
//               color: Colors.grey[800],
//             ),
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(
//                 vertical: 10.0,
//               ),
//               border: InputBorder.none,
//               icon: Icon(
//                 Icons.search,
//               ),
//               hintText: '搜索商品',
//               hintMaxLines: 1,
//               hintStyle: TextStyle(
//                 fontSize: 14.0,
//                 color: Color.fromARGB(255, 173, 173, 173),
//               ),
//               hasFloatingPlaceholder: false,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // 导航栏上的扫一扫按钮
// class _HomeScanButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlatButton(
//         padding: EdgeInsets.all(0.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(
//               Icons.filter_center_focus,
//               color: Colors.white,
//             ),
//             Text(
//               '扫一扫',
//               maxLines: 1,
//               style: TextStyle(
//                 fontSize: 10.0,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }

// // 导航栏上消息按钮
// class _HomeMessageButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 56.0,
//       child: FlatButton(
//         padding: EdgeInsets.all(0.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(
//               Icons.message,
//               color: Colors.white,
//             ),
//             Text(
//               '消息',
//               maxLines: 1,
//               style: TextStyle(
//                 fontSize: 10.0,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }

// // 下载文件
// void downloadFile() async {
//   Directory directory = await getApplicationDocumentsDirectory();
//   String path = directory.path;
//   print('$path');

//   SharedNetwork().download(
//     'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action@1.0/docs/imgs/book.jpg',
//     '${directory.path}/book.jpg',
//     success: (data) {
//       print(data);
//     },
//   );
// }

// 轮播图
class _SliderWidget extends StatelessWidget {
  // 比例
  static const double ratio = 144.0 / 355.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xFFEEEEEE),
          height: MediaQuery.of(context).size.width * ratio + 10.0,
        ),
        // 弧形视图
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFEEEEEE),
          child: Image.asset(
            'images/home_arc_bg.png',
            fit: BoxFit.fill,
          ),
        ),
        // 轮播图
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          color: Colors.transparent,
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(
                'http://www.globalsecuritydefense.com/bcf821d6ba6070cf14c98c63bf25987b.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.width * ratio,
        ),
      ],
    );
  }
}

// 首页广告图片
class _AdvertisingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Color(0xFFEEEEEE),
        child: Image.asset(
          'images/home_ad.png',
          fit: BoxFit.fill,
        ),
        padding: EdgeInsets.only(
          top: 15.0,
          left: 15.0,
          right: 15.0,
        ),
        height: MediaQuery.of(context).size.width * (100.0 / 345.0),
      ),
      onTap: () {
        Toast.toast(context, '点击广告');
      },
    );
  }
}

// 楼层标题
class _FloorHeaderWidget extends StatelessWidget {
  // 标题
  final String title;

  const _FloorHeaderWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      height: 56.0,
      padding: EdgeInsets.only(
        top: 10.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 34, 34, 34),
              ),
            ),
            Container(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      '更多',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 160, 160, 160),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 160, 160, 160),
                      size: 13.0,
                    )
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
