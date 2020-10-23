import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desktop/routers/routers.dart';
import 'package:flutter_desktop/util/app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 防止UI随着手机的旋转而在横竖屏间切换
    // 设置支持的方向：
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // ios设置支持的方向：  ios/Runner/Info.plist
//    <array>
//        <string>UIInterfaceOrientationPortrait</string>
//    </array>
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Cupertino中文
      ],
      supportedLocales: [
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
      locale: const Locale('zh', 'CH'),
      theme: ThemeData(
          textTheme: TextTheme(
            // 按钮textStyle
              button: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              )
          ),
          buttonColor: Colors.red,
          canvasColor: Colors.white
      ),
    );
  }
}
