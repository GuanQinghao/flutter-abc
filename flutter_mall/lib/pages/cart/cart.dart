import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with AutomaticKeepAliveClientMixin {
  // 是否全选
  bool _isSelectedAll = false;
  // 是否是编辑状态
  bool _editable = false;
  // 购物车商品列表
  List<Map<String, dynamic>> products = [
    {
      'title':
          'OPPO Find X2 超感官旗舰 3K分辨率 120Hz超感屏 多焦段影像系统 骁龙865 65w闪充 8GB+256GB碧波 双模5G手机',
      'image':
          'https://img14.360buyimg.com/n0/jfs/t1/114393/1/1069/692776/5e94670fEa28b8cd3/228f1632e85e8337.jpg',
      'price': 5999.00,
      'count': 1,
      'isSelected': 1,
    },
    {
      'title': 'Apple iPhone XS (A2100) 64GB 金色 移动联通电信4G手机',
      'image':
          'https://img14.360buyimg.com/n0/jfs/t1/1468/11/3377/138213/5b997bf3Eda5b24a4/0ace3ed19582dbe6.jpg',
      'price': 5199.00,
      'count': 2,
      'isSelected': 0,
    },
    {
      'title':
          'Apple 2019款 MacBook Pro 13.3【带触控栏】八代i5 8G 256G RP645显卡 深空灰 笔记本电脑 MUHP2CH/A',
      'image':
          'https://img14.360buyimg.com/n0/jfs/t1/50965/16/16199/67242/5dd26e06E686fcc3b/c39fe0cb7ab36c13.jpg',
      'price': 10799.00,
      'count': 1,
      'isSelected': 1,
    },
    {
      'title': '飞天茅台 53度 500ml 2014年',
      'image':
          'https://img14.360buyimg.com/n0/jfs/t1/85310/26/12386/252984/5e464d9eEf4a2981c/b51005d0450609d3.jpg',
      'price': 3169.00,
      'count': 6,
      'isSelected': 0,
    },
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 7, 53),
        centerTitle: true,
        title: Text(
          '购物车',
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                _editable = !_editable;
              });
            },
            child: Container(
              child: Text(
                _editable ? '完成' : '编辑',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color(0xFFEEEEEE),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCartProductListTile(context, index);
                },
              ),
            ),
          ),
          Container(
            height: 56.0,
            // 左右边距
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: Colors.grey[300],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 全选按钮
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    width: 70.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          _isSelectedAll
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                        ),
                        Text('全选'),
                      ],
                    ),
                  ),
                ),

                // 合计金额
                Container(
                  child: Offstage(
                    offstage: _editable,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '合计:',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '￥350.00',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _editable = !_editable;
                      });
                    },
                    child: Text(
                      '结算',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 购物车单个商品的Widget
  Widget _buildCartProductListTile(BuildContext context, int index) {
    Map<String, dynamic> product = products[index];
    // 商品名称
    String _title = product['title'];
    // 商品图片
    String _image = product['image'];
    // 商品价格
    double _price = product['price'];
    // 商品数量
    int _count = product['count'];
    // 是否选中
    bool _isSelected = (0 == product['isSelected']);

    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // 选中按钮
              Container(
                child: IconButton(
                  icon: Icon(
                    _isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 20.0,
                  ),
                  onPressed: () {
                    //TODO:
                    if (mounted) {
                      setState(() {});
                    }
                  },
                ),
              ),
              // 商品图片
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Image.network(
                  _image,
                  height: 90.0,
                  width: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 110.0,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // 商品价格
                            Text(
                              '¥$_price',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            // 商品数量
                            Container(
                              child: Container(
                                width: 90.0,
                                height: 24.0,
                                padding: EdgeInsets.only(
                                  left: 5.0,
                                  right: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[300],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: GestureDetector(
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          onTap: () {
                                            //TODO:
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 1.0,
                                      color: Colors.grey[300],
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Text(
                                          '$_count',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 1.0,
                                      color: Colors.grey[300],
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.add,
                                            size: 14.0,
                                          ),
                                          onTap: () {
                                            //TODO:
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
