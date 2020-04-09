import 'package:flutter/material.dart';

class Toast {
  // toast靠它加到屏幕上
  static OverlayEntry _overlayEntry;
  // toast是否正在showing
  static bool _isShowing = false;
  // 开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static DateTime _currentTime;
  // 信息
  static String _message;
  // 持续时长(单位: 毫秒)
  static int _duration = 1500;

  static void toast(
    BuildContext context,
    String message,
  ) async {
    assert(message != null);
    _message = message;
    _currentTime = DateTime.now();

    // 获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _isShowing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          //top值，可以改变这个值来改变toast在屏幕中的位置
          top: 0.8 * MediaQuery.of(context).size.height,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 80.0,
              ),
              child: AnimatedOpacity(
                // 目标透明度
                opacity: _isShowing ? 1.0 : 0.0,
                duration: _isShowing
                    ? Duration(milliseconds: 100)
                    : Duration(milliseconds: 400),
                child: _buildToastWidget(),
              ),
            ),
          ),
        ),
      );
      overlayState.insert(_overlayEntry);
    } else {
      // 重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
    await Future.delayed(
      Duration(milliseconds: _duration),
    ); // 等待时长

    // 消失
    if (DateTime.now().difference(_currentTime).inMilliseconds >= _duration) {
      _isShowing = false;
      _overlayEntry.markNeedsBuild();
    }
  }

  // toast绘制
  static _buildToastWidget() {
    return Center(
      child: Card(
        color: Colors.black26,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: Text(
            _message,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
