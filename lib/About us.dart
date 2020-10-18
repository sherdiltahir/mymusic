import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';



class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
         Row(mainAxisAlignment: MainAxisAlignment.start,children: [
           Container(margin:EdgeInsets.only(left: 20,top: 20),child: Text("About US",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Poppins",fontSize: 40),),)
           ,

         ],),
          SizedBox(height: 60,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30,),
              Container(height: 60,width: 70, child: SvgPicture.asset("assets/images/logo.svg",height: 50,width: 60,fit: BoxFit.fill,color: Colors.deepOrange,)),
            ],
          ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding:EdgeInsets.only(left: 30),child: Text("Visit Our Website:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Poppins",fontSize: 20))),
            ],
          )
          ,SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding:EdgeInsets.only(left: 30),child: TextButton(onPressed: _launchURL, child: Text("http://mpire.radio"))),
            ],
          ),
          SizedBox(height: 200,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding:EdgeInsets.only(left: 30),width: MediaQuery.of(context).size.width*0.5,child:  Text("Proudly designed and developed by PROGRAMMERS VALLEY",style: TextStyle(color: Colors.black, fontFamily: "Poppins",fontSize: 12),textAlign: TextAlign.center,)),
            ],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding:EdgeInsets.only(left: 30),width: MediaQuery.of(context).size.width*0.5,child:  Text("Visit our website:",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontFamily: "Poppins",fontSize: 15))),
            ],
          )
          ,SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding:EdgeInsets.only(left: 30),child: TextButton(onPressed: _launchURL2, child: Text("Programmers Valley"))),
            ],
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
  _launchURL() async {
    const url = 'http://mpire.radio';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = 'https://progvalley.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
