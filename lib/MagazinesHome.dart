import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymusic/Colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'magazinesviewer.dart';

class Magazines extends StatefulWidget {
final  String magurl;
  Magazines({this.magurl});
  @override
  _MagazinesState createState() => _MagazinesState();
}

class _MagazinesState extends State<Magazines> {

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),title: Center(child: Text("Mpire Magazine",style: TextStyle(color: appBlack),)),backgroundColor: Colors.white,),
      body: WebView(
        initialUrl: widget.magurl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
