import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FormFieldPage extends StatefulWidget {
  @override
  _FormFieldPageState createState() => _FormFieldPageState();
}

class _FormFieldPageState extends State<FormFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormField"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["Form中的单个表单字段。"]),
          TitleTextPage("例子:"),
          FormFieldDemo()
        ],
      ),
    );
  }
}

class FormFieldDemo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FormField<String>(
              builder: (FormFieldState<String> field) {
                return TextField(

                );
              },
              onSaved: (v) => print("onSaved: $v"),
              initialValue: "账号",
              validator: (String v) {
                print("validator: $v");
                if (v == null || v.isEmpty) {
                  return "账号不能为空！"; // 貌似只有 TextFormField采用errText
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  print('onPressed');
                  print(_formKey.currentState.validate());
                  if (_formKey.currentState.validate()) {
                    print("Process data");
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
