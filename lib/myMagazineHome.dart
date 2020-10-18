import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymusic/MagazinesHome.dart';
import 'package:mymusic/radiohomescreen.dart';
import 'package:mymusic/video.dart';

import 'About us.dart';
import 'magazinesviewer.dart';
import 'mainhomescreen.dart';

class MagazinessHome extends StatefulWidget {
  @override
  _MagazinessHomeState createState() => _MagazinessHomeState();
}

class _MagazinessHomeState extends State<MagazinessHome> {

  Future future;
double height=0;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Container(
              child: Text(
                "Magazine",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
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
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {

                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Magazines(
                                      magurl: snapshot.data[index]
                                      ["magazineUrl"],
                                    )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    padding: EdgeInsets.only(left: 20,right: 20),
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: Center(
                                      child:
                                      Image(image: NetworkImage(snapshot.data[index]["imageUrl"]),fit: BoxFit.fill,),

                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: Text(snapshot.data[index]["title"],style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: "Poppins"),),
                                  )
                                ],
                              ),
                            ],
                          ));
                    });
              }
            },
          ),
        ],
      ),
    );
  }
}
