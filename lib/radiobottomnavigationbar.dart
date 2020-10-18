import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymusic/MagazinesHome.dart';
import 'package:mymusic/radiohomescreen.dart';
import 'package:mymusic/video.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'About us.dart';
import 'Colors.dart';
import 'mainhomescreen.dart';
import 'myMagazineHome.dart';

class RadioBottomNavController extends StatefulWidget {

  @override
  _RadioBottomNavControllerState createState() => _RadioBottomNavControllerState();
}

class _RadioBottomNavControllerState extends State<RadioBottomNavController> {
  int _currentscreen = 0;
  List screens = <Widget>[
    MpireRadioHome(),
    Video(),
    MainHome(),
    MagazinessHome(),
    AboutUS()
  ];
  Future future;

  Future getdata() async {
    // ignore: deprecated_member_use
    var mymusicdata = Firestore.instance;
// ignore: deprecated_member_use
    QuerySnapshot qn =
    await mymusicdata.collection("Mphirmagzines").getDocuments();
// ignore: deprecated_member_use

// ignore: deprecated_member_use
    return qn.documents;
  }

  @override
  void initState() {
    future = getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(backgroundColor: Colors.white,automaticallyImplyLeading: false,title: Container(child: SvgPicture.asset("assets/images/logo.svg",
            color: Colors.deepOrange, height: 30, width: 70)),),
        body: screens[_currentscreen],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: appWhite,
          color: appBlack,
          buttonBackgroundColor: appOrange,
          height: 60,
          animationDuration: Duration(
            milliseconds: 200,
          ),
          index: 0,
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
              _currentscreen = index;
            });
          },
        )
    );
  }
}
