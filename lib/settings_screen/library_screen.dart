import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<String> _daftarLibrary = [
    'google_nav_bar: ^2.0.0',
    'flutter_screenutil: ^1.0.2',
    'intl: ^0.16.1',
    'slide_digital_clock: ^1.0.0',
    'firebase_ml_vision: ^0.9.3+8',
    'image_picker: ^0.6.3+4',
    'translator: ^0.1.4',
    'flutter_spinkit: ^3.1.0',
    'expansion_tile_card: ^1.0.2+2'

  ];
  void showSnackBarTitle(){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Opps Link Rusak'),
      )
    );
}
  Future<void> _launchUrl( )async{
    const url = 'https://flutter.dev';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'url error $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool scroll){
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('images/triangle.jpeg',fit: BoxFit.cover,),
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: Text('Library yang digunakan'),
              ),
            )
          ];
        },
          body :Card(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: _daftarLibrary.length,
            itemBuilder: (context, i){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                child: Text('${i+1} \t '+_daftarLibrary[i],style: TextStyle(color: Colors.grey),),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 400,left: 10),
            child: Text('Source : Pub.dev',style: TextStyle(color: Colors.grey),),
          ),
        ],
      ),
    ),
      ),
    );
  }
}
