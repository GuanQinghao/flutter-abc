import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mall/models/product_model.dart';
import 'package:flutter_mall/pages/common/search_bar.dart';
import 'package:flutter_mall/pages/common/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
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
          setState(() {
            // 隐藏
            showTopButton = false;
          });
        } else if (_controller.offset >= MediaQuery.of(context).size.height &&
            showTopButton == false) {
          setState(() {
            // 显示
            showTopButton = true;
          });
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // 内存释放
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // 导航条
      appBar: SearchBar(
        height: 56.0,
      ),
      body: ListView(
        controller: _controller,
        children: <Widget>[
          // 轮播图
          _buildSliderWidget(),
          // 广告图
          _buildAdvertisingWidget(),
          // 秒杀
          _buildRecommendProductsWidget(),
          // 1楼标题
          _buildFloorHeaderWidget('楼层商品1'),
          // 1楼商品
          _buildFirstFloorProductsWidget(),
          // 2楼标题
          _buildFloorHeaderWidget('楼层商品2'),
          // 2楼商品
          _buildSecondFloorProductsWidget(),
          // 热门推荐标题
          _buildFloorHeaderWidget('热门推荐'),
          // 热门推荐
          _buildHotProductsWidget(items),
          // 猜你喜欢标题
          _buildFloorHeaderWidget('猜你喜欢'),
          // 猜你喜欢
          _buildFavouriteProductsWidget(items),
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

  // 轮播图
  Widget _buildSliderWidget() {
    // 比例
    const double ratio = 144.0 / 355.0;

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
                'http://photo.16pic.com/00/53/72/16pic_5372081_b.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.width * ratio,
        ),
      ],
    );
  }

  // 首页广告图片
  Widget _buildAdvertisingWidget() {
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

  // 楼层标题
  Widget _buildFloorHeaderWidget(String title) {
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

  // 乐淘秒杀商品列表
  Widget _buildRecommendProductsWidget() {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.only(
        top: 15.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          height: 271.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 0.5 * (MediaQuery.of(context).size.width - 21.0),
                child: Column(
                  children: <Widget>[
                    // 乐淘秒杀
                    ___buildFlashSaleWidget(),
                    Divider(
                      height: 1.0,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                    // 券多多
                    __buildDomesticProductsWidget('券多多', '券多多优惠'),
                  ],
                ),
              ),
              VerticalDivider(
                width: 1.0,
                color: Color.fromARGB(255, 224, 224, 224),
              ),
              Container(
                width: 0.5 * (MediaQuery.of(context).size.width - 21.0),
                child: Column(
                  children: <Widget>[
                    // 国货专区
                    __buildDomesticProductsWidget('国货专区', '品质新生活'),
                    Divider(
                      height: 1.0,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                    // 抽奖
                    __buildDomesticProductsWidget('抽奖试手气', '试手气乐乐乐')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 秒杀商品集合
  Widget ___buildFlashSaleWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 45.0,
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: __buildFlashSaleCountdownWidget(),
          ),
          Container(
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                __buildFlashSaleProductWidget(),
                __buildFlashSaleProductWidget(),
                __buildFlashSaleProductWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 秒杀倒计时视图
  Widget __buildFlashSaleCountdownWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('images/flash_sale.png'),
              fit: BoxFit.fitHeight,
              height: 20.0,
            ),
          ),
          Container(
            child: Container(),
          ),
        ],
      ),
    );
  }

  // 秒杀商品视图
  Widget __buildFlashSaleProductWidget() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Image(
                  width: 50.0,
                  height: 50.0,
                  image: AssetImage('images/product.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 15.0,
              child: Text(
                '¥158',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 237, 0, 45),
                ),
              ),
            ),
            Container(
              height: 15.0,
              child: Text(
                '¥ 99',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 10.0,
                  color: Color.fromARGB(255, 160, 160, 160),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
    );
  }

  // 国货专区视图
  Widget __buildDomesticProductsWidget(String title, String subtitle) {
    return GestureDetector(
      child: Container(
        height: 135.0,
        padding: EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20.0,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 34, 34),
                ),
              ),
            ),
            Container(
              height: 15.0,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 84, 5),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('images/product.png'),
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    child: Image(
                      image: AssetImage('images/product.png'),
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
    );
  }

  // 1楼商品列表
  Widget _buildFirstFloorProductsWidget() {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Container(
        // 圆角
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: __buildSaleProductWidget(),
              ),
              Container(
                height: 5.0,
                width: 5.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    __buildSnappedProductWidget(0),
                    Container(
                      // color: Colors.yellow,
                      height: 5.0,
                      width: 5.0,
                    ),
                    __buildSnappedProductWidget(1),
                  ],
                ),
              ),
              Container(
                // color: Colors.yellow,
                height: 5.0,
                width: 5.0,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    __buildSnappedProductWidget(1),
                    Container(
                      // color: Colors.yellow,
                      height: 5.0,
                      width: 5.0,
                    ),
                    __buildSnappedProductWidget(0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1楼畅销商品
  Widget __buildSaleProductWidget() {
    return Container(
      color: Color.fromARGB(25, 247, 0, 47),
      height: 196.0,
      child: Container(
        padding: EdgeInsets.only(
          top: 12.0,
          bottom: 14.0,
          left: 12.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 22.0,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '六一狂欢',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 0, 47),
                    ),
                  ),
                  Image.asset(
                    'images/fire.png',
                    width: 15.0,
                    height: 15.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 18.0,
              alignment: Alignment.centerLeft,
              child: Text(
                '最低价 9.9包邮',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromARGB(255, 160, 160, 160),
                ),
              ),
            ),
            Container(
              height: 16.0,
              alignment: Alignment.centerLeft,
              child: Container(
                // 圆角
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 74, 109),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                padding: EdgeInsets.only(
                  left: 6.0,
                  right: 6.0,
                ),
                child: Text(
                  '儿童小零食1238g',
                  style: TextStyle(
                    fontSize: 9.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              height: 95.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage('images/product.png'),
                      fit: BoxFit.fill,
                      height: 95.0,
                      width: 95.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '¥52',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 74, 109),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1楼限时抢购商品视图
  Widget __buildSnappedProductWidget(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xffeeeeee),
            height: 96.0,
            width: 96.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Text(
                    '便捷旋转捷旋转拖把',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 34, 34, 34),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 4.0,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage('images/product.png'),
                    width: 60.0,
                    height: 60.0,
                  ),
                ),
              ],
            ),
          ),
          IndexedStack(
            // 0显示，1不显示
            index: index,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                ),
                width: 50.0,
                child: Container(
                  height: 12.0,
                  padding: EdgeInsets.only(
                    right: 6.0,
                  ),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 0, 47),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0),
                    ),
                  ),
                  child: Text(
                    '限时抢购',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2楼商品列表
  Widget _buildSecondFloorProductsWidget() {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: __buildBestProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: __buildBestProductWidget(),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 5.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: __buildMostProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: __buildMostProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: __buildMostProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: __buildMostProductWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 2楼商品大视图
  Widget __buildBestProductWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 110.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
          // color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('images/product.png'),
                width: 90.0,
                height: 90.0,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 90.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Container(
                      child: Container(
                        height: 16.0,
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 0, 47),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          '6.1狂欢',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '¥189',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 255, 0, 47),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 2楼畅销商品小视图
  Widget __buildMostProductWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        height: 120,
        child: Column(
          children: <Widget>[
            Container(
              height: 80.0,
              padding: EdgeInsets.all(5.0),
              color: Color(0xFFEEEEEE),
              child: Container(
                child: Image.asset(
                  'images/product.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                '¥654321',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 0, 47),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  // top: 5.0,
                  ),
              child: Text(
                '2302已售',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 热门推荐列表
  Widget _buildHotProductsWidget(List<ProductModel> items) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      color: Color(0xFFEEEEEE),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: <Widget>[
                // 广告图
                __buildHotAdvertisingImageWidget(),
                Container(
                  height: 265,
                  child: GridView.builder(
                    itemCount: (items == null) ? 0 : items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 108.0 / 130.0,
                    ),
                    itemBuilder: (context, index) {
                      return __buildHotProductWidget(items[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 热门推荐广告图片
  Widget __buildHotAdvertisingImageWidget() {
    return Container(
      height: 110.0,
      padding: EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        bottom: 5.0,
      ),
      child: Container(
        height: 105.0,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
          child: Image.network(
            'http://photo.16pic.com/00/93/40/16pic_9340774_b.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  // 热门推荐商品视图
  Widget __buildHotProductWidget(ProductModel item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        color: Color(0xffeeeeee),
        child: Column(
          children: <Widget>[
            Image.network(
              item.defaultPicUrl,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              alignment: Alignment.centerLeft,
              child: Text(
                item.itemTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 34, 34, 34),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              alignment: Alignment.centerLeft,
              child: Text(
                '¥' + item.marketPrice.toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 247, 0, 47),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 猜你喜欢列表
  Widget _buildFavouriteProductsWidget(List<ProductModel> items) {
    // 列表商品视图的宽高比
    final double ratio = 0.66;
    return Container(
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
      ),
      child: Container(
        height: ((MediaQuery.of(context).size.width - 10.0) * 1.5 / ratio),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: ratio,
          ),
          itemCount: (items == null) ? 0 : items.length,
          itemBuilder: (context, index) {
            return __buildFavouriteProductWidget(items[index]);
          },
        ),
      ),
    );
  }

  // 猜你喜欢商品视图
  Widget __buildFavouriteProductWidget(ProductModel item) {
    // 商品名称
    String title = item.itemTitle ?? '商品';
    // 商品价格
    String price =
        (null != item.marketPrice) ? item.marketPrice.toString() : '0.0';
    // 门店价
    String salePrice =
        (null != item.wholesalePrice) ? item.wholesalePrice.toString() : '0.0';
    // 商品销量
    String count = (null != item.salesNum) ? item.salesNum.toString() : '0';

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Color(0xffeeeeee),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image(
                            image: NetworkImage(item.defaultPicUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    // 商品标题
                    Container(
                      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 28, 28, 28),
                        ),
                      ),
                    ),
                    // 商品价格
                    Container(
                      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(
                              '¥' + price,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 247, 0, 47),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '门店价¥' + salePrice,
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 173, 173, 173),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 商品店铺和销量
                    Container(
                      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 10.0,
                                  color: Color.fromARGB(255, 51, 51, 51),
                                ),
                                Text(
                                  '万达专营店',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromARGB(255, 135, 135, 135),
                                  ),
                                ),
                                Text(
                                  '1.2km',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromARGB(255, 97, 97, 97),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(),
                            child: Text(
                              '月销' + count,
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromARGB(255, 135, 135, 135),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // 国货标志
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'images/guo.png',
                      height: 22.0,
                      width: 22.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
