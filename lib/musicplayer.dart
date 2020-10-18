import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymusic/radiobottomnavigationbar.dart';

import 'package:share/share.dart';

import 'homemain.dart';

String songurls;
class Musicplayer extends StatefulWidget {
  final String songname;
  final String songurl;
  final String singername;
final String imageurl;
  Musicplayer({this.songname,this.songurl,this.singername,this.imageurl});
  @override
  _MusicplayerState createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  Musicplayer mymusic;
  bool playing = false;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool circularindicator = true;
  format(Duration duration) => duration.toString().substring(2, 7);
Future future;

  @override

  void initState()  {
getAudio();
loadAsset();
super.initState();
  }
  Future<ByteData> loadAsset() async {
    return await rootBundle.load(songurls);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
          appBar: AppBar(
iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Center(child: Text("Music",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),)),
          ),
          body:
                 Column(   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Image(
                          image: NetworkImage(widget.imageurl)),
                    ),
                    Text(widget.songname,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    Text("By ${widget.singername}"),
                    Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      Container(margin: EdgeInsets.only(right: 30),child: Text("${format(position).toString()} / ${format(duration).toString()}")),
                    ],),
                    slider(),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            getAudio();
                          },
                          child: Icon(
                            playing == false
                                ? Icons.play_circle_outline_outlined
                                : Icons.pause_circle_outline_outlined,
                            size: 110,
                            color: Colors.deepOrange,
                          ),
                        ),
                        SizedBox(width: 40,),
                        CircleAvatar(backgroundColor: Colors.black,
                          radius: 50,
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                 share(context);
                              },
                              child:Icon(
                                Icons.ios_share,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )  ],)



      ),
    );
  }
void share(BuildContext context){
    print("hello");
  final text = widget.songurl;
  final RenderBox box = context.findRenderObject();
  Share.share(text,subject: widget.songname,sharePositionOrigin:box.localToGlobal(Offset.zero)&box.size );
}
  Widget slider() {
    return Slider.adaptive
      (
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(Duration(seconds: value.toInt()));
        });
      },
    );
  }

  Future<ByteData> getAudio() async {
    var url = await widget.songurl;

    if (playing == true) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;

        });
      }
    } else {
      int res = await audioPlayer.play(url,isLocal: true);
      if (res==1) {
        setState(()   {
          playing = true;
        });

      }
    }
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration= d;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        position= p;
      });
    });
  }


  /*circularindicatorfunction(){
    setState(() {
      circularindicator = false;
    });
  }*/

/*  void timers()async{

    Timer(Duration(seconds: 7) , circularindicatorfunction);

  }*/

  Future<bool> _onBackPress() {
    audioPlayer.stop();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>RadioBottomNavController()));
  }
}



