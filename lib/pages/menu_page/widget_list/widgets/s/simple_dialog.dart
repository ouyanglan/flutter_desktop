import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SimpleDialogPage extends StatefulWidget {
  @override
  _SimpleDialogPageState createState() => _SimpleDialogPageState();
}

class _SimpleDialogPageState extends State<SimpleDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleDialog"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["对话框, 选项通常使用SimpleDialogOption小部件。"]),
          TitleTextPage("例子:"),
          SimpleDialogDemo(),
        ],
      ),
    );
  }
}

class SimpleDialogDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: const Text('Select assignment'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Treasury department'),
                    ),
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('State department'),
                    ),
                  ],
                );
              }
            );
          },
          child: Text("Show Dialog"),
        ),
      ],
    );
  }
}
