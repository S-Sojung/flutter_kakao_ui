import 'package:flutter/material.dart';
import 'package:flutter_kakao_ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      //router가 없는데 대신 bottom navigation을 사용할 것
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

