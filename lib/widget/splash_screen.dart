import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terjemahkeun_app/page/home_page.dart';
import 'package:terjemahkeun_app/page/settings_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime()async{
    var _durasi = Duration(seconds: 3);
    return new Timer(_durasi, navigtionPage);
  }

  void navigtionPage(){
    Navigator.pushReplacementNamed(context, '/navBar');
  }
  @override
  void initState() {
    // TODO: implement initState
    startTime();
    HomePage();
    SettingsPage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(800)),
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/logoApp.png')
                  )
              ),
            ),
            Text('by febry ardiansyah',style: TextStyle(color: Colors.black38),),
            SizedBox(height: 20,),
            SpinKitThreeBounce(color: Colors.blue,size: 30,)
          ],
        ),
      ),
    );
  }
}
