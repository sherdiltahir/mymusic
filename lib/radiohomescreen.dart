import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymusic/radiotimes.dart';
import 'Colors.dart';
import 'musicplayer.dart';
import 'radioData.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MpireRadioHome extends StatefulWidget {
  @override
  _MpireRadioHomeState createState() => _MpireRadioHomeState();
}

class _MpireRadioHomeState extends State<MpireRadioHome> {
  int totalpics = audio().length;
  Future future;

  Future getdata() async {
    // ignore: deprecated_member_use
    var mymusicdata = Firestore.instance;
// ignore: deprecated_member_use
    QuerySnapshot qn =
        await mymusicdata.collection("Mphirmusic").getDocuments();
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  "Non-Stop Radio muziek van eigen bodem.\nÉcht van eigen bodem.",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.21,
                width: MediaQuery.of(context).size.width * 0.81,
                padding: EdgeInsets.only(top: 10),
                child: WebView(
                  initialUrl: "https://embed.radio.co/player/3e759e4.html",
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ],
          ),
          /* SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.userFriends,
                color: Colors.deepOrange,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "8526 keer beluisterd",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),*/
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Songs List",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: getdata(),
            builder: (BuildContext ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Musicplayer(
                                          singername: snapshot.data[index]
                                              ["singerName"],
                                          songname: snapshot.data[index]
                                              ["title"],
                                          songurl: snapshot.data[index]
                                              ["songUrl"],
                                          imageurl: snapshot.data[index]
                                              ["imageUrl"],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      color: Color(0xFFFFAB91),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data[index]["imageUrl"]),
                                          fit: BoxFit.fill)),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 120,
                                        color: Colors.black54,
                                        child: Text(
                                          snapshot.data[index]["title"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            },
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 1.46,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: totalpics,
                        itemBuilder: (BuildContext context, int index) {
                          if (index % 2 == 0) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                 Navigator.push(context,  MaterialPageRoute(
                                     builder: (context) => RadioTime(
                                       title: audio()[index].title,
                                       description:
                                       audio()[index].description,
                                       image: audio()[index].imgeurl,
                                     )));
                                },
                                child: Image(
                                  image: AssetImage(audio()[index].imgeurl),
                                  fit: BoxFit.fill,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              ),
                            );
                          } else
                            return SizedBox(
                              height: 10,
                            );
                        }),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1.46,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: totalpics,
                        itemBuilder: (BuildContext context, int index) {
                          if (index % 2 == 1) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RadioTime(
                                                title: audio()[index].title,
                                                description:
                                                    audio()[index].description,
                                                image: audio()[index].imgeurl,
                                              )));
                                },
                                child: Image(
                                  image: AssetImage(audio()[index].imgeurl),
                                  fit: BoxFit.fill,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              ),
                            );
                          } else
                            return SizedBox(
                              height: 10,
                            );
                        }),
                  ),
                ],
              ),
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage("assets/images/radiopics/Banner2.png"),
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 5,
            child: Container(
              color: appOrange,
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
