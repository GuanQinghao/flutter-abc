import 'package:flutter/material.dart';

import 'toast.dart';

// 广告
class HomeAdWidget extends StatelessWidget {
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
