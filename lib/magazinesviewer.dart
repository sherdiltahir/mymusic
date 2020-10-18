import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MphirMagazineViewer extends StatefulWidget {
 final String pdfurl;
 MphirMagazineViewer({this.pdfurl});
  @override
  _MphirMagazineViewerState createState() => _MphirMagazineViewerState();
}

class _MphirMagazineViewerState extends State<MphirMagazineViewer> {
  bool loading = true;
  PDFDocument doc;

  @override
  void initState() {
    getdoc();
    // TODO: implement initState
    super.initState();
  }
  getdoc()async{
    doc = await PDFDocument.fromURL(widget.pdfurl);
    setState(() {
      loading= false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),backgroundColor: Colors.white,title: SvgPicture.asset("assets/images/logo.svg",height: 20,width: 30,color: Colors.deepOrange,),),
      body: Center(
child: loading?Center(child: CircularProgressIndicator(),):
PDFViewer(document: doc,)),

    );

  }
}
