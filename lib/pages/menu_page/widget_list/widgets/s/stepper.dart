import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["步骤进度组件。"]),
          TitleTextPage("例子:"),
          StepperDemo(),
        ],
      ),
    );
  }
}

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stepper(
        physics: new ClampingScrollPhysics(),
//        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepTapped: (int index) {
          print("onStepTapped: $index");
        },
        onStepContinue: () {
          print(_currentStep);
          setState(() {
            if (_currentStep < 4) {
              _currentStep ++;
            } else {
              _currentStep = 4;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep = 0;
          });
        },
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            children: <Widget>[
              FlatButton(
                onPressed: onStepContinue,
                child: const Text('CONTINUE'),
              ),
              FlatButton(
                onPressed: onStepCancel,
                child: const Text('CANCEL'),
              ),
            ],
          );
        },
        steps: [
          Step(
              title: Text("第一步"),
              subtitle: Text("副标题"),
              content: Text("内容区域"),
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
              isActive: true
          ),
          Step(
              title: Text("第二步"),
//            subtitle: Text("副标题"),
              content: Text("内容区域"),
              isActive: true,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed),
          Step(
              title: Text("第三步"),
//            subtitle: Text("副标题"),
              content: Text("内容区域"),
              isActive: true,
              state: _currentStep > 2 ? StepState.complete : StepState.indexed),
          Step(
              title: Text("第四步"),
//            subtitle: Text("副标题"),
              content: Text("内容区域"),
              isActive: true,
              state: _currentStep > 3 ? StepState.complete : StepState.indexed),
          Step(
              title: Text("第五步"),
//            subtitle: Text("副标题"),
              content: Text("内容区域"),
              isActive: true,
              state: _currentStep >= 4 ? StepState.complete : StepState.indexed),
        ],
      ),
    );
  }
}
