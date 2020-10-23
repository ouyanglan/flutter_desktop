import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/el.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ToggleButtonsPage extends StatefulWidget {
  @override
  _ToggleButtonsPageState createState() => _ToggleButtonsPageState();
}

class _ToggleButtonsPageState extends State<ToggleButtonsPage> {

  List<Widget> _children1;
  List<Widget> _children2;
  List<bool> _isSelected = new List();
  List<bool> _singleSelected = new List();

  @override
  void initState() {
    super.initState();
    _children1 = [
      Text("多选"),
      Icon(Icons.call),
      Icon(Icons.cake),
    ];
    _children2 = [
      Text("单选"),
      Icon(Icons.call),
      Icon(Icons.cake),
    ];
    for (int i = 0; i < _children1.length; i++) {
      _isSelected.add(false);
    }
    for (int i = 0; i < _children2.length; i++) {
      _singleSelected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToggleButtons"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("ToggleButtons简介:"),
          ContentTextPage(["创建一组水平的切换按钮。"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "children: 按钮组。",
            "isSelected: 控制按钮组中按钮的选中状态。",
            "onPressed: 点击按钮触发的函数, 携带被点击按钮的下标。",
            "constraints: 控制按钮大小, 默认48。",
            "textStyle: 按钮为Text时可以设置文本的样式, color不能设置。"
            "color: 未被选中按钮的颜色, 只有按钮为Text或Icon时有效。",
            "selectedColor: 按钮选中时的颜色, 只有按钮为Text或Icon时有效。",
            "disabledColor: 按钮被禁用时的颜色, 也就是onPressed为null。",
            "fillColor: 选中时的背景颜色。",
            "splashColor: 点击时的波纹颜色。",
            "hoverColor: 按钮获取焦点时的颜色。",
            "renderBorder: 是否有边框, 默认有(true)。",
            "borderColor: 未选中时的边框颜色。",
            "selectedBorderColor: 选中时的边框颜色。",
            "disabledBorderColor: 禁用时的边框颜色。",
            "borderWidth: 边框宽度。",
            "borderRadius: 边框圆角。",
          ]),
          TitleTextPage("例子:"),
          Container(
            alignment: Alignment.center,
            child: ToggleButtons(
              isSelected: _isSelected,
              children: _children1,
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 120,
              ),
              color: Colors.red,
              selectedColor: Colors.deepPurpleAccent,
              disabledColor: Colors.black26,
              fillColor: Colors.lightBlueAccent,
              splashColor: Colors.yellowAccent,
              hoverColor: Colors.lime,
//              renderBorder: false,
              borderColor: Colors.black,
              selectedBorderColor: Colors.deepPurple,
              disabledBorderColor: Colors.red,
              borderWidth: 3,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              onPressed: (int index) => _onPressed(index),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0),
            child: ToggleButtons(
              children: _children2,
              isSelected: _singleSelected,
              onPressed: (int index) => _singlePressed(index),
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 120
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onPressed(int index) {
    _isSelected[index] = !_isSelected[index];
    setState(() {
    });
  }

  void _singlePressed(int index) {
    for (int i = 0; i < _singleSelected.length; i++) {
      if (i == index) {
        _singleSelected[i] = !_singleSelected[i];
      } else if (_singleSelected[i]) {
        _singleSelected[i] = false;
      }
    }
    setState(() {
    });
  }
}
