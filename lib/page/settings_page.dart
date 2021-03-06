import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terjemahkeun_app/settings_screen/library_screen.dart';
import 'package:terjemahkeun_app/settings_screen/tentang_aplikasi_screen.dart';
import 'package:terjemahkeun_app/settings_screen/tentang_developer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
//      backgroundColor: Color(0xFF33B6FF),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _barAtas(),
              _kartuNama(),
              _isiKartu(),
            ],
          ),
          _tentangAplikasi(),
         !isExpand? _bottomLogo():Center(),
        ],
      ),
    );
  }

  Widget _barAtas(){
    return Container(
      height: ScreenUtil().setHeight(1000),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/barAtas.png'),
          fit: BoxFit.fill
        )
      ),
    );
  }
  Widget _kartuNama(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(600)),
        height: ScreenUtil().setHeight(400),
        width: ScreenUtil().setWidth(1000),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF0085FF),
              Color(0xFF00FF29)
            ]
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(10,10),
              color: Colors.black12,
              blurRadius: 12
            )
          ]
        ),
      ),
    );
  }
  Widget _isiKartu(){
    return Positioned(
      top: ScreenUtil().setHeight(650),
      left: ScreenUtil().setHeight(100),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('images/me.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Febry Ardiansyah',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              Row(
                children: <Widget>[
                  Icon(Icons.email,color: Colors.white,size: 15,),
                  Text('18104009@ittelkom-pwt.ac.id',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(40)),),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.white,size: 15,),
                  Text('Purwokerto, Jawa Tengah',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(40)),),
                ],
              ),
              InkWell(
                onTap: (){
                  TentangDeveloper().showBottomSheet(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Text('Lihat Detail',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                      Icon(Icons.arrow_forward_ios,size: 15,color: Colors.blue[900],)
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget _tentangAplikasi(){
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 10),
      child: ExpansionTileCard(
        elevation: 4,
        leading: CircleAvatar(child: Icon(Icons.toc),),
        title: Text('Tentang Aplikasi'),
        subtitle: Text('Klik untuk lihat detail'),
        borderRadius: BorderRadius.all(Radius.circular(40)),
        onExpansionChanged: (bool value){
          setState(() {
            isExpand = value;
          });
        },
        children: <Widget>[
          Divider(thickness: 1,height: 1,),
          ListTile(
            leading: Icon(Icons.help),
            title: Container(child: Text('Apa itu TerjemahKeun ?')),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TentangAplikasi()));
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Library yang digunakan'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryScreen()));
            },
          )
        ],
      ),
    );
  }
  Widget _bottomLogo(){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/logoApp.png')
              )
          ),
        ),
        Text('by febry ardiansyah',style: TextStyle(color: Colors.black38),),
      ],
    );
  }
}
