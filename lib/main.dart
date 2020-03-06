
import 'package:flutter/material.dart';
import 'package:terjemahkeun_app/widget/bottom_navbar.dart';
import 'package:terjemahkeun_app/widget/splash_screen.dart';

void main() async => runApp (
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/navBar',
      routes: {
        '/': (_) => SplashScreen(),
        '/navBar': (_) => BottomNavBar()
      },
    )
);


