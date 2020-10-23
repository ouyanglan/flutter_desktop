import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CustomSingleChildLayoutPage extends StatefulWidget {
  @override
  _CustomSingleChildLayoutPageState createState() => _CustomSingleChildLayoutPageState();
}

class _CustomSingleChildLayoutPageState extends State<CustomSingleChildLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomSingleChildLayout"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["控制单个子元素布局及尺寸的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "delegate: SingleChildLayoutDelegate的子类。",
          ]),
          TitleTextPage("例子:"),
          CustomSingleChildLayoutDemo()
        ],
      ),
    );
  }
}

class CustomSingleChildLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 300,
      child: CustomSingleChildLayout(
        delegate: _Delegate(Size(200, 100)),
        child: Container(
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}

class _Delegate extends SingleChildLayoutDelegate {

  final Size childSize;

  _Delegate(this.childSize);

  // 控制子元素尺寸
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(childSize);
  }

  // 控制子元素位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: CustomSingleChildLayout父元素的size
    return Offset(size.width / 2 - this.childSize.width / 2, size.height / 2 - this.childSize.height / 2);
  }

  @override
  bool shouldRelayout(_Delegate oldDelegate) {
    return childSize != oldDelegate.childSize;
  }

}
