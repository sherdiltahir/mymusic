import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mymusic/radiohomescreen.dart';
import 'package:mymusic/video.dart';

import 'Colors.dart';
import 'package:flutter_svg/svg.dart';

import 'MagazinesHome.dart';
import 'file:///D:/Mpir/mymusic/lib/About%20us.dart';
import 'mainhomescreen.dart';
import 'myMagazineHome.dart';

class Home extends StatefulWidget {
final  int  screenindexs;
Home({this.screenindexs});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 2;
  List screens = <Widget>[
    MpireRadioHome(),
    Video(),
    MainHome(),
    MagazinessHome(),
    AboutUS()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appWhite,
          title: Container(
              child: SvgPicture.asset("assets/images/logo.svg",
                  color: appOrange, height: 30, width: 70)),
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
        ),
        body: screens[_currentindex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: appWhite,
          color: appBlack,
          buttonBackgroundColor: appOrange,
          height: 60,
          animationDuration: Duration(
            milliseconds: 200,
          ),
          index: 2,
          animationCurve: Curves.bounceInOut,
          items: <Widget>[
            Icon(Icons.radio, size: 30, color: appWhite),
            Icon(Icons.live_tv, size: 30, color: appWhite),
            Icon(Icons.home, size: 30, color: appWhite),
            Icon(Icons.menu_book_sharp, size: 30, color: appWhite),
            Icon(Icons.error, size: 30, color: appWhite),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
        ));

  }
}
