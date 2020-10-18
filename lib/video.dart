import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymusic/Colors.dart';
import 'package:mymusic/videoplayer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  Future future;
  Future future1;
  String mycategory;
  Future getdata(String category) async {
    // ignore: deprecated_member_use
    var mymusicdata = Firestore.instance;
// ignore: deprecated_member_use
    QuerySnapshot qn = await mymusicdata.collection("Vimeo").where("categoryName",isEqualTo: category).getDocuments();
// ignore: deprecated_member_use

// ignore: deprecated_member_use
    return qn.documents;
  }

  Future getcategorydata() async {
    // ignore: deprecated_member_use
    var mymusicdata = Firestore.instance;
// ignore: deprecated_member_use
    QuerySnapshot qn =
        await mymusicdata.collection("MpireTvCategories").getDocuments();
// ignore: deprecated_member_use

// ignore: deprecated_member_use
    return qn.documents;
  }

  @override
  void initState() {
    future = getdata("Specials");
    future1 = getcategorydata();
    mycategory = "Specials";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 8,
            child: WebView(
              initialUrl: "https://vimeo.com/event/339741/embed",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Video Category",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ),
          FutureBuilder(
            future: getcategorydata(),
            builder: ( ctx,  snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {

                                setState(() {
                                  mycategory =
                                      snapshot.data[index]["categoryName"];
                                });

                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: appBlack, width: 1)),
                                  height: 60,
                                  width: 150,
                                  child: Center(
                                      child: Text(
                                    snapshot.data[index]["categoryName"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ));
                      }),
                );
              }
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "$mycategory Videos",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: getdata(mycategory),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {

                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(bottom: 70),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {

                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlayer(
                                              videoid: snapshot.data[index]
                                                  ["vimeoID"],
                                            )));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data[index]["imageUrl"]),
                                            fit: BoxFit.fill)),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 50,
                                          child: Text(
                                            snapshot.data[index]["title"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ));

                      }),
                );
              }
            },
          )
        ],
      ),
    );
  }
}


