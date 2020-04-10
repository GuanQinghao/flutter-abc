import 'package:flutter/material.dart';

class HomeSecondFloorProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      child: _BestProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _BestProductWidget(),
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
                      child: _MostProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _MostProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _MostProductWidget(),
                    ),
                    VerticalDivider(
                      color: Colors.transparent,
                      width: 5.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _MostProductWidget(),
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

// 商品-大视图
class _BestProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

// 畅销商品-小视图
class _MostProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
