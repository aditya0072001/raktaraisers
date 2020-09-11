import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rakta Raisers',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _page.toString(),
              style: TextStyle(color: Colors.grey[300]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.red,
        buttonBackgroundColor: Colors.white,
        key: _bottomNavigationKey,
        height: 50,
        index: 1,
        items: [
          GestureDetector(
              child: Icon(Icons.supervised_user_circle,
                  size: 20, color: Colors.black),
              onTap: () {
                final CurvedNavigationBarState navBarState =
                    _bottomNavigationKey.currentState;
                navBarState.setPage(0);
              }),
          GestureDetector(
              child: Icon(Icons.add, size: 20, color: Colors.black),
              onTap: () {
                final CurvedNavigationBarState navBarState =
                    _bottomNavigationKey.currentState;
                navBarState.setPage(1);
              }),
          GestureDetector(
              child: Icon(Icons.receipt, size: 20, color: Colors.black),
              onTap: () {
                final CurvedNavigationBarState navBarState =
                    _bottomNavigationKey.currentState;
                navBarState.setPage(2);
              }),
          GestureDetector(
              child: Icon(Icons.map, size: 20, color: Colors.black),
              onTap: () {
                final CurvedNavigationBarState navBarState =
                    _bottomNavigationKey.currentState;
                navBarState.setPage(3);
              }),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
