import 'package:flutter/material.dart';

// 秒杀
class HomeRecommendProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    _HomeFlashSaleWidget(),
                    Divider(
                      height: 1.0,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                    // 券多多
                    _HomeDomesticProductsWidget(
                      title: '券多多',
                      subtitle: '券多多优惠',
                    ),
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
                    _HomeDomesticProductsWidget(
                      title: '国货专区',
                      subtitle: '品质新生活',
                    ),
                    Divider(
                      height: 1.0,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                    // 抽奖
                    _HomeDomesticProductsWidget(
                      title: '抽奖试手气',
                      subtitle: '试手气乐乐乐',
                    )
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

// 秒杀
class _HomeFlashSaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 45.0,
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: _FlashSaleCountdownWidget(),
          ),
          Container(
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _FlashSaleProductWidget(),
                _FlashSaleProductWidget(),
                _FlashSaleProductWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 秒杀倒计时
class _FlashSaleCountdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Container(
              child: Text('倒计时'),
            ),
          ),
        ],
      ),
    );
  }
}

// 秒杀商品
class _FlashSaleProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        Navigator.pushNamed(context, '/GoodsDetail');
      },
    );
  }
}

// 国货商品
class _HomeDomesticProductsWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const _HomeDomesticProductsWidget(
      {Key key, @required this.title, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Navigator.pushNamed(context, '/GoodsDetail');
      },
    );
  }
}
