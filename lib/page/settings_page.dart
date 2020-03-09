import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  Text('18104009@ittelkom-pwt.ac.id',style: TextStyle(color: Colors.white,fontSize: 15),),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.white,size: 15,),
                  Text('Purwokerto, Jawa Tengah',style: TextStyle(color: Colors.white,fontSize: 15),),
                ],
              ),
              InkWell(
                onTap: (){
                  _tentangDeveloper(context);
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
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Package yang digunakan'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
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
  void _tentangDeveloper(context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_){
          return Container(
            height: ScreenUtil().setHeight(1600),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(51),topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-10,-10),
                  color: Colors.black38,
                  blurRadius: 12
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black,
                  Colors.blue
                ]
              )
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
                Divider(),
                Center(
                  child: Text('Tentang Saya',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset('images/boxMe.png',width: 350,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(550),left: 60),
                      child: Image.asset('images/introBox.png',),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:ScreenUtil().setHeight(900),left: 10),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: ScreenUtil().setWidth(500),bottom: 10),
                            child: Image.asset('images/instagramBox.png',width: 200,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: ScreenUtil().setWidth(500),bottom: 10),
                            child: Image.asset('images/githubBox.png',width: 200,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: ScreenUtil().setWidth(500),bottom: 10),
                            child: Image.asset('images/discordBox.png',width: 200,),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}
