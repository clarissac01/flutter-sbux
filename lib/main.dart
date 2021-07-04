import 'package:flutter/material.dart';
import 'package:starbucks/pages/login.dart';
import 'package:starbucks/utils/globals.dart' as global;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: global.darkThemed ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
