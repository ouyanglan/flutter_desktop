import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可拖动组件搭配DragTarget使用。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "feedback：拖动中显示的组件",
            "onDragStarted：开始拖动时触发",
            "onDragCompleted：被DragTarget接收后触发",
          ]),
          TitleTextPage("例子:"),
          DraggableDemo()
        ],
      ),
    );
  }
}

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {

  String _dragTargetText = "DragTarget";

  String _draggableText = "Draggable";

  int _i = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Draggable<String>(
            data: _draggableText + _i.toString(),
            child: Container(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              color: Colors.deepPurpleAccent,
              child: Text(_draggableText + _i.toString())
            ),
            feedback: Container(
              width: 200,
              height: 100,
              color: Colors.cyan,
              child: Icon(Icons.feedback),
            ),
            onDragStarted: () {
              print("onDragStarted");
            },
            onDragCompleted: () {
              setState(() {
              });
              print("onDrafCompleted");
            },
            onDragEnd: (v) {
              print("onDragEnd: $v");
            },
            onDraggableCanceled: (velocity, offset) {
              print("cancel: $velocity");
              print("cancel: $offset");
            },
          ),
          SizedBox(height: 100,),
          DragTarget<String>(
            builder: (BuildContext context, List<dynamic> candidateData, List<dynamic> rejectedData){
              return Container(
                width: 200,
                height: 100,
                color: Colors.cyan,
                alignment: Alignment.center,
                child: Text(_dragTargetText),
              );
            },
            onAccept: (v) {
              setState(() {
                _dragTargetText = v;
              });
              _i++;
            },
            onLeave: (v) {
              print("onLeave: $v");
            },
            onWillAccept: (v) {
              print("onWillAccept: $v");
              if (v != null) {
                return true;
              }
              return false;
            },
          ),
        ],
      ),
    );
  }
}
