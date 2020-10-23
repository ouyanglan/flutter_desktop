import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app.dart';


class Message {

  static List<bool> _messageList = new List();

  static void success({
    @required BuildContext context,
    @required String message,
    int seconds = 2,
    bool showCloseIcon = true,
  }) {
    _createOverlay(context, message, seconds, Color(0xffe1f3d8), Color(0xff67c23a), showCloseIcon);
  }

  static void warning({
    @required BuildContext context,
    @required String message,
    int seconds = 2,
    bool showCloseIcon = true,
  }) {
    _createOverlay(context, message, seconds, Color(0xfffaecd8), Color(0xffe6a23c), showCloseIcon);
  }

  static void error({
    @required BuildContext context,
    @required String message,
    int seconds = 2,
    bool showCloseIcon = true,
  }) {
    _createOverlay(context, message, seconds, Color(0xfffef0f0), Color(0xfff56c6c), showCloseIcon);
  }

  static void _createOverlay(BuildContext context, String message, int seconds, Color background, Color testColor, bool showCloseIcon,) {
    int index;
    if (_messageList.isNotEmpty) {
      _messageList.forEach((element) {

      });
      bool checked = false;
      for (int i = 0; i < _messageList.length; i++) {
        if (!_messageList[i]) {
          index = i;
          _messageList[i] = true;
          checked = true;
          // 长度大于10时, 删除为false的元素
          if (_messageList.length > 10) {
            int length = _messageList.length - 1;
            for (int j = length; j >= 0; j--) {
              if (!_messageList[j]) {
                _messageList.removeAt(j);
              }
            }
          }
          break;
        }
      }
      if (!checked) {
        _messageList.add(true);
        index = _messageList.length - 1;
      }
    } else {
      _messageList.add(true);
      index = _messageList.length - 1;
    }

    double _top = 60.0 + index * 45 + index * 10;
    print(_messageList.length);
    Widget _iconButton = Text('');
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return Positioned(
          top: _top,
          left: App.width * 0.5 - 150,
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(message != null ? message : '', style: TextStyle(color: testColor),),
                ),
                _iconButton
              ],
            ),
            color: background,
          )
      );
    });
    if (showCloseIcon) {
      _iconButton = IconButton(
        icon: Icon(Icons.close, color: testColor, size: 15,),
        onPressed: () => _removeOverlay(overlayEntry, index),
      );
    }
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //根据seconds给定的时间移除Toast
    new Future.delayed(Duration(seconds: seconds)).then((value) {
      _removeOverlay(overlayEntry, index);
    });
  }

  static void _removeOverlay(OverlayEntry overlayEntry, int index) {
    overlayEntry.remove();
    _messageList[index] = false;
  }
}
