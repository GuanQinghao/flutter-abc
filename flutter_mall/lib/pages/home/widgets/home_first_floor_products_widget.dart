import 'package:flutter/material.dart';

class HomeFirstFloorProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: _SaleProductWidget(),
              ),
              Container(
                // color: Colors.yellow,
                height: 5.0,
                width: 5.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _SnappedProductWidget(
                      index: 0,
                    ),
                    Container(
                      // color: Colors.yellow,
                      height: 5.0,
                      width: 5.0,
                    ),
                    _SnappedProductWidget(
                      index: 1,
                    ),
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
                    _SnappedProductWidget(
                      index: 1,
                    ),
                    Container(
                      // color: Colors.yellow,
                      height: 5.0,
                      width: 5.0,
                    ),
                    _SnappedProductWidget(
                      index: 0,
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
}

class _SaleProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class _SnappedProductWidget extends StatelessWidget {
  final int index;

  const _SnappedProductWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
