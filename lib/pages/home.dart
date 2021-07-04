import 'package:flutter/cupertino.dart';
import 'package:starbucks/main.dart';
import 'package:starbucks/pages/drinks.dart';
import 'package:starbucks/pages/homedetail.dart';
import 'package:starbucks/utils/globals.dart' as global;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  var _currIdx = 0;
  var pages = [HomeDetail(), DrinksPage()];
  var theme = global.darkThemed;

  void onTabTapped(int idx) {
    setState(() {
      _currIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: global.darkThemed ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(global.username),
          leading: IconButton(
              icon: Image.asset('assets/logo.png'),
              iconSize: 10,
              onPressed: () {}),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Text('Light'),
                        Switch(
                          value: theme,
                          onChanged: (value) {
                            setState(() {
                              global.darkThemed = !global.darkThemed;
                              theme = value;
                            });
                          },
                          activeColor: Colors.black87,
                          activeTrackColor: Colors.black,
                        ),
                        Text('Dark')
                      ],
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text('Log Out'),
                    value: 1,
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => App()),
                      (route) => false);
                } else {
                  setState(() {
                    global.darkThemed = !global.darkThemed;
                    theme = global.darkThemed;
                  });
                }
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currIdx,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Drinks'),
          ],
        ),
        body: pages[_currIdx],
      ),
    );
  }
}
