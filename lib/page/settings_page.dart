import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
        backgroundColor: Color(0xFF33B6FF),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text('Tentang Developer',style: TextStyle(color: Colors.grey),),
              ),
              tentangDeveloper(),
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 10),
                child: Text('Tentang Aplikasi',style: TextStyle(color: Colors.grey),),
              ),
              tentangAplikasi(),
            ],
          ),
        ),
      ),
    );
  }
  Widget tentangDeveloper(){
    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        height: ScreenUtil().setHeight(650),
      ),
    );
  }
  Widget tentangAplikasi(){
    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        padding: EdgeInsets.all(10),
        height: ScreenUtil().setHeight(500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
                child: Container(
                  height: 30,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text('Tentang aplikasi ini',style: TextStyle(fontSize: 15),)),
              onTap: (){},
            ),
            Divider(),
            InkWell(
              child: Container(
                height: 30,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Text('Package yang digunakan aplikasi ini',style: TextStyle(fontSize: 15),)),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
