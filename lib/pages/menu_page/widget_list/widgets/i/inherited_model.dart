import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'package:flutter_desktop/util/app.dart';

class InheritedModelPage extends StatefulWidget {
  @override
  _InheritedModelPageState createState() => _InheritedModelPageState();
}

class _InheritedModelPageState extends State<InheritedModelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedModel"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["让一个深度嵌套的widget访问最外层widget的数据, 可以实现局部更新, InheritedWidget加强版(更新所有)。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "。",
          ]),
          TitleTextPage("例子:"),
          InheritedModelDemo()
        ],
      ),
    );
  }
}


class InheritedModelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InheritedModelDemoState();
  }
}

class _InheritedModelDemoState extends State<InheritedModelDemo> {

  int _a = 0;
  int _b = 0;
  int _c = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _a++;
                });
              },
              color: App.color,
              child: Text("A++"),
            ),
            SizedBox(width: 20,),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _b++;
                });
              },
              color: App.color,
              child: Text("B++"),
            ),
            SizedBox(width: 20,),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _c++;
                });
              },
              color: App.color,
              child: Text("C++"),
            ),
          ],
        ),
        MyModel(
            a: _a,
            b: _b,
            c: _c,
            child: const Demo(), // 这里必须使用const
        )
      ],
    );
  }
}

class A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("A build ===>>>>>>>");
    final myModel = MyModel.of(context, ModelEnum.a);
    return Text('A:${myModel.a}');
  }
}

class Demo extends StatelessWidget {
  const Demo();
  @override
  Widget build(BuildContext context) {
    print("demo  build");
    return Column(
      children: [
        A(),
        B(),
        C(),
      ],
    );
  }
}



class B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("B build ===>>>>>>>");
    final myModel = MyModel.of(context, ModelEnum.b);
    return  Text('B:${myModel.b}');
  }
}

class C extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 通过Builder可以更新更细粒度的Widget
        Builder(
          builder: (BuildContext context) {
            print("C1 build ===>>>>>>>");
            final myModel = MyModel.of(context, ModelEnum.c);
            return Text("C1: ${myModel.c};");
          },
        ),
        SizedBox(width: 20,),
        // 修改c时这里不会重新build
        Builder(
          builder: (BuildContext context) {
            print("C2 build ===>>>>>>>");
            return Text("C2");
          },
        )
      ],
    );
  }
}

enum ModelEnum {
  a, b, c
}

class MyModel extends InheritedModel<ModelEnum> {

  final int a;
  final int b;
  final int c;

  MyModel({
    Key key,
    this.a,
    this.b,
    this.c,
    Widget child
  }) : super(child: child);

  static MyModel of(BuildContext context, ModelEnum aspect) {
    return InheritedModel.inheritFrom<MyModel>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(MyModel old) {
    return a != old.a || b != old.b || c != old.c;
  }

  @override
  bool updateShouldNotifyDependent(MyModel oldWidget, Set<ModelEnum> aspects) {
    return (a != oldWidget.a && aspects.contains(ModelEnum.a))
        || (b != oldWidget.b && aspects.contains(ModelEnum.b))
        || (c != oldWidget.c && aspects.contains(ModelEnum.c));
  }
}
