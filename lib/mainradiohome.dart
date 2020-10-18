import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'musicplayer.dart';

class MusicPlayerHome extends StatefulWidget {
  @override
  _MusicPlayerHomeState createState() => _MusicPlayerHomeState();
}

class _MusicPlayerHomeState extends State<MusicPlayerHome> {
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
        // ignore: deprecated_member_use
        body: FutureBuilder(
      future: getdata(),
      builder: (BuildContext ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Musicplayer(
                                    singername: snapshot.data[index]
                                        ["artist name"],
                                    songname: snapshot.data[index]["song name"],
                                    songurl: snapshot.data[index]["song url"],
                                  )));
                    },
                    child: ListTile(
                      title: Text(
                          "${index + 1}.  ${snapshot.data[index]["song name"]}"),
                      subtitle:
                          Text("     ${snapshot.data[index]["artist name"]}"),
                    ));
              });
        }
      },
    ));
  }
}
