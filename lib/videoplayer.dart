import 'package:flutter/material.dart';
import 'package:flutter_youtube_vimeo/flutter_youtube_vimeo.dart';
class VideoPlayer extends StatefulWidget {
final  String videoid;
  VideoPlayer({this.videoid});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: YouVimPlayer("vimeo",widget.videoid),
    );

  }
}
