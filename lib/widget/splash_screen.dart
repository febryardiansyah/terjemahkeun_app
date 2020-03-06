import 'dart:async';

import 'package:flutter/material.dart';
import 'package:terjemahkeun_app/widget/gradient_bg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime()async{
    var _durasi = Duration(seconds: 3);
    return new Timer(_durasi, navigtionPage);
  }

  navigtionPage(){
    Navigator.pushReplacementNamed(context, '/navBar');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Gradient_BG(
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logoApp.png')
              )
            ),
          ),
        ),
      ),
    );
  }
}
