import 'package:flutter/material.dart';

class HomeHotProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                _HotAdImageWidget(),
                Container(
                  height: 265,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 108.0 / 130.0,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      _HotProductWidget(),
                      _HotProductWidget(),
                      _HotProductWidget(),
                      _HotProductWidget(),
                      _HotProductWidget(),
                      _HotProductWidget(),
                    ],
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

class _HotAdImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            'http://www.globalsecuritydefense.com/bcf821d6ba6070cf14c98c63bf25987b.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class _HotProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/GoodsDetail');
      },
      child: Container(
        color: Color(0xffeeeeee),
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/product.png',
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              alignment: Alignment.centerLeft,
              child: Text(
                '山东烟台大樱桃山东烟台大樱桃',
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
                '¥36',
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
}
