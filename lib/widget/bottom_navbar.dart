import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:terjemahkeun_app/page/home_page.dart';
import 'package:terjemahkeun_app/page/settings_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedPage = 0;

 final List<Widget> _children = [
   HomePage(),
   SettingsPage()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.init(context);
    
    return Scaffold(
      body: _children[selectedPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(220),right: ScreenUtil().setWidth(200)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.blue,
            boxShadow: [
              BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.20),
                  offset: Offset(0, 15))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GNav(
              gap: 1,
              color: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              activeColor: Colors.blue,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                  backgroundColor: Colors.white,
                ),
                GButton(
                  icon: Icons.toc,
                  text: 'Tentang',
                  backgroundColor: Colors.white,
                ),
              ],
              selectedIndex: selectedPage,
              onTabChange: (index) {
                setState(() {
                  selectedPage = index;
                });
              }),
        ),
      ),
    );
  }
}
