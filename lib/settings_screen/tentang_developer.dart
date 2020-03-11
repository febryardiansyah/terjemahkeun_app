import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TentangDeveloper{
  Widget showBottomSheet(BuildContext context){
    ScreenUtil.init(context);
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