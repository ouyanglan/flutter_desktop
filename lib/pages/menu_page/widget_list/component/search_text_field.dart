import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef OnTextChangeBack<String> = void Function(String value);
class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
  final double height;
  final OnTextChangeBack<String> onTextChangeBack;
  SearchTextField({this.height, this.onTextChangeBack});
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController _textController;
  bool _showCancelIcon = false;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: CupertinoTextField(
        controller: _textController,
        placeholder: '搜索',
        style: TextStyle(
          fontSize: 14
        ),
        prefix: Icon(Icons.search, color: Colors.black38, size: 20,),
        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
        suffix: _showCancelIcon ?
        GestureDetector(
          child: Icon(Icons.cancel, color: Colors.black38, size: 20,),
          onTap: () {
            setState(() {
              _showCancelIcon = false;
            });
            _textController.clear();
            widget.onTextChangeBack(null);
          },
        )
            : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black38, width: 1)
        ),
        onChanged: (String v) {
          widget.onTextChangeBack(v);
          setState(() {
            _showCancelIcon = v.isNotEmpty;
          });
        },
      ),
    );
  }
}
