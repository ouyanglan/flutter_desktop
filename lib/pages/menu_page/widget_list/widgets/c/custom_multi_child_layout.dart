import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CustomMultiChildLayoutPage extends StatefulWidget {
  @override
  _CustomMultiChildLayoutPageState createState() => _CustomMultiChildLayoutPageState();
}

class _CustomMultiChildLayoutPageState extends State<CustomMultiChildLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomMultiChildLayout"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["控制多个子元素布局。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "delegate: 需要自定义一个delegate类 extends MultiChildLayoutDelegate。",
            "children: 子元素集，每个子元素需要用LayoutId()包裹并设置唯一的id。",
          ]),
          TitleTextPage("例子:"),
          CustomMultiChildLayoutDemo()
        ],
      ),
    );
  }
}

class CustomMultiChildLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black12,
      child: CustomMultiChildLayout(
        delegate: _Delegate(),
        children: _Delegate.DELEGATE_IDS.asMap().keys.map((index) {
          return LayoutId(
            id: _Delegate.DELEGATE_IDS[index],
            child: Container(
              width: 100,
              height: 50,
              color: index % 2 == 0 ? Colors.lightBlue : Colors.deepPurpleAccent,
            ),
          );
        }).toList()
      ),
    );
  }
}

class _Delegate extends MultiChildLayoutDelegate {
  static const List<String> DELEGATE_IDS = ["a", "b", "c"];
  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = BoxConstraints.loose(size);
    Size aSize = layoutChild(DELEGATE_IDS[0], constraints);
    positionChild(DELEGATE_IDS[0], Offset(0, 0));
    int length = DELEGATE_IDS.length;
    if (length > 1) {
      for (int i = 1; i < length; i++) {
        layoutChild(DELEGATE_IDS[i], constraints);
        positionChild(DELEGATE_IDS[i], Offset(aSize.width * i, aSize.height * i));
      }
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }

}
