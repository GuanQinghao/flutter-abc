// 楼层标题
import 'package:flutter/material.dart';

class HomeFloorHeaderWidget extends StatelessWidget {
  // 标题
  final String title;

  const HomeFloorHeaderWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
