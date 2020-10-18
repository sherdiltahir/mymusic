import 'package:flutter/material.dart';

class RadioTime extends StatefulWidget {
final  String title;
final String description;
final String image;
  RadioTime({this.title,this.description,this.image});
  @override
  _RadioTimeState createState() => _RadioTimeState();
}

class _RadioTimeState extends State<RadioTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(iconTheme:IconThemeData(color: Colors.black),title: Center(child: Text(widget.title,style: TextStyle(color: Colors.black),),),backgroundColor: Colors.white,),
      body: ListView(
        children: [
          Row(children: [
            
            Container(child: Image(image: AssetImage("assets/images/RadioBanner.png"),fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width,))

          ],),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(widget.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Poppins"),)
          ],),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 200,width: MediaQuery.of(context).size.width*0.9,child: Text(widget.description,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: "Poppins"),))
            ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [

            Container(child: Image(image: AssetImage(widget.image),fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width*0.5,height:200,))

          ],),
          SizedBox(height: 10,),
          Row(children: [

            Container(child: Image(image: AssetImage("assets/images/radiopics/MYBANNER.png"),fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width,))

          ],),
        ],
      ),
    );
  }
}
