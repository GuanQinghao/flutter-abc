import 'package:flutter/material.dart';

// 轮播图
class HomeSlideWidget extends StatelessWidget {
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
