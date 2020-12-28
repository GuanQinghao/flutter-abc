import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/common/toast.dart';

// 商品列表页
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // 选中的筛选按钮索引值
  int _filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 路由传过来的参数值
    Map _product = ModalRoute.of(context).settings.arguments;
    String _title = _product['title'];
    return Scaffold(
      appBar: AppBar(
        // 取消阴影
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          _title,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1C1D),
          ),
        ),
        leading: Container(
          width: 56.0,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF1C1C1D),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: <Widget>[
          Container(
            width: 56.0,
            child: FlatButton(
              onPressed: () {
                Toast.toast(context, '点击分享');
              },
              child: Icon(
                Icons.share,
                color: Color(0xFF1C1C1D),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // 搜索框
          _buildSearchBarWidget(),
          // 广告位
          _buildAdvertisementSpotWidget(),
          // 筛选条件
          _buildFilterWidget(),
          // 商品列表
          Expanded(child: _buildProductsWidget()),
        ],
      ),
    );
  }

  // 商品列表的搜索框
  Widget _buildSearchBarWidget() {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      color: Color(0xFFFFFFFF),
      alignment: Alignment.center,
      height: 45.0,
      child: Theme(
        data: ThemeData(
          primaryColor: Color(0xFFFFFFFF),
        ),
        child: Container(
          height: 30.0,
          padding: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
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
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
      ),
    );
  }

  // 广告位
  Widget _buildAdvertisementSpotWidget() {
    return Image.network(
        'https://p.geitu.net/18/5qNWt-.jpg?x-oss-process=image/resize,w_760,limit_1');
  }

  // 筛选条件
  Widget _buildFilterWidget() {
    return Container(
      height: 45.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // 综合
          Container(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _filterIndex = 0;
                });
              },
              child: Text(
                '综合',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: (0 == _filterIndex)
                      ? Color(0xFFFF463C)
                      : Color(0xFF1C1C1D),
                ),
              ),
            ),
          ),
          // 销量
          Container(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _filterIndex = 1;
                });
              },
              child: Text(
                '销量',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: (1 == _filterIndex)
                      ? Color(0xFFFF463C)
                      : Color(0xFF1C1C1D),
                ),
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _filterIndex = 2;
                });
              },
              child: Text(
                '价格',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: (2 == _filterIndex)
                      ? Color(0xFFFF463C)
                      : Color(0xFF1C1C1D),
                ),
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _filterIndex = 3;
                });
              },
              child: Text(
                '筛选',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: (3 == _filterIndex)
                      ? Color(0xFFFF463C)
                      : Color(0xFF1C1C1D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 商品列表
  Widget _buildProductsWidget() {
    // 商品数量
    int _count = 30;
    // 每行个数
    int _rowCount = 2;
    // 每行高度固定
    double _rowHeight = 230.0;
    // 单个宽度
    double _width = (MediaQuery.of(context).size.width - 10.0) / 2;
    // 单个宽高比
    double ratio = _width / _rowHeight;

    return Container(
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      color: Color(0xFFEEEEEE),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _rowCount,
          childAspectRatio: ratio,
        ),
        itemCount: _count,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product',
                arguments: '商品详情',
              );
            },
            child: __buildProductWidget(),
          );
        },
      ),
    );
  }

  // 商品视图
  Widget __buildProductWidget() {
    // 商品名称
    String title = '熟冻爱尔兰黄金蟹鲜烹速冻面包蟹港荣蒸蛋糕 饼干蛋糕 手撕面包口袋吐司 营养早';
    // 商品价格
    String price = '369.9';
    // 商品销量
    String count = '1099';

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        color: Color(0xFFEEEEEE),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // 商品图片
                    Container(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: SizedBox(
                          height: 150.0,
                          child: Image(
                            image: NetworkImage(
                                'https://img14.360buyimg.com/n0/jfs/t1/50965/16/16199/67242/5dd26e06E686fcc3b/c39fe0cb7ab36c13.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    // 商品标题
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    // 商品价格
                    Container(
                      height: 30.0,
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
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
                              count + '人已付款',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Color(0xFFADADAD),
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
