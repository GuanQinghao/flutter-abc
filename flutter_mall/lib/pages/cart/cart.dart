import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // 是否全选
  bool _isSelectedAll = false;
  // 是否是编辑状态
  bool _editable = false;

  Map<String, dynamic> products = <String, dynamic>{
    'title': '潮男长袖T恤-李宁长袖T恤男士2020新款BADFIVE篮球系列圆领宽松休闲针织运动服',
    'image': 'images/product.png',
    'price': 299.00,
    'count': 2,
    'isSelected': 1,
  };

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              child: ListView(
                children: <Widget>[
                  _CartProductWidget(
                    product: products,
                  ),
                ],
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
}

class _CartProductWidget extends StatelessWidget {
  // 购物车中的商品
  final Map<String, dynamic> product;

  const _CartProductWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  onPressed: () {},
                ),
              ),
              // 商品图片
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Image.asset(
                  'images/product.png',
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
                            Text(
                              '¥$_price',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              child: Text('x$_count'),
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
