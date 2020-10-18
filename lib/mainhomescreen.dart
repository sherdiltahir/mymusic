import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymusic/magazinebottomnavigationbar.dart';
import 'package:mymusic/radiobottomnavigationbar.dart';
import 'package:mymusic/videobottomnavigationbar.dart';

import 'Colors.dart';

import 'radioData.dart';
import 'homemain.dart';


class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int totalpics = audio().length;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Home",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only( left: 20),
          child: Text(
            "Mpire Tv",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>VideoBottomNavController()));
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(

              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/mpiretv.jpeg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop))),
              child: Center(
                child: Stack(
                  children: [
                 Column(children: [
                   Expanded(flex: 5,child: Container(margin: EdgeInsets.only(bottom: 160),child: CircleAvatar(radius: 30,backgroundColor: appOrange,child: Icon(Icons.wifi_tethering_rounded,color: appWhite,size: 30,)))),


                 ],)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only( left: 20),
          child: Text(
            "Mpire Radio"
            ,
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: (){
Navigator.push(context,MaterialPageRoute(builder: (context)=>RadioBottomNavController()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left:10,right: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/mpireradio.jpeg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop))),
              child: Center(
                child: Stack(
                  children: [
                    Column(children: [
                      Expanded(flex: 5,child: Container(margin: EdgeInsets.only(bottom: 160),child: CircleAvatar(radius: 30,backgroundColor: appOrange,child: Icon(Icons.music_note_rounded,color: appWhite,size: 30,)))),

                    ],)
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Mpire Magazines",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MagazineBottomNavController()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/mpiremagazine.jpeg"),colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      fit: BoxFit.fill))
            ),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
