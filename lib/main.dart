import 'package:flutter/material.dart';
import 'package:mymusic/magazinesviewer.dart';
import 'package:mymusic/video.dart';
import 'package:mymusic/videoplayer.dart';
import 'homemain.dart';
import 'mainradiohome.dart';


import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mpire",
      home: Home(),
    );
  }
}
