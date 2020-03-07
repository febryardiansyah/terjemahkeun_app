import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:terjemahkeun_app/home_screen/englishToIndo.dart';
import 'package:terjemahkeun_app/home_screen/indoToEnglish.dart';
import 'package:terjemahkeun_app/widget/gradient_bg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Gradient_BG(
      child: Stack(
        children: <Widget>[
          ucapanWaktu(),
          vectorWelcome(),
          pilihBahasa(),
        ],
      ),
    );
  }

  String logikaWaktu(){
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    String pesan = '';

    if(timeNow <= 12){
      pesan = 'Selamat Pagi,,';
      return pesan;
    }else if((timeNow > 12) && (timeNow <=16)){
      pesan = 'Selamat Siang,,';
      return pesan;
    }else if((timeNow >16) && (timeNow<20)){
      pesan = 'Selamat Sore,,';
      return pesan;
    }else{
      pesan = 'Selamat Malam,,';
      return pesan;
    }
  }
  String saranMakan(){
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    String pesan = '';

    if(timeNow <= 12){
      pesan = 'Sudah Sarapan Belum ??';
      return pesan;
    }else if((timeNow > 12) && (timeNow <=16)){
      pesan = 'Sudah Makan Siang Belum ??';
      return pesan;
    }else if((timeNow >16) && (timeNow<20)){
      pesan = 'Sudah Makan Malam ??';
      return pesan;
    }else{
      pesan = 'Jangan Lupa Tidur';
      return pesan;
    }
  }
  String tglSkrng(){
    var now = new DateTime.now();
    var format = DateFormat("dd MMM yyy").format(now);
    String tgl = format;
    return tgl;
  }
  Widget ucapanWaktu(){
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(120),left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(logikaWaktu(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
          Text(saranMakan(),style: TextStyle(color: Colors.white,fontSize: 20),),
          SizedBox(height: 20,),
          Text(tglSkrng(),style: TextStyle(color: Color(0xFF155753),fontSize: 30,fontWeight: FontWeight.bold),),
          DigitalClock(
            areaWidth: 150,
            digitAnimationStyle: Curves.elasticOut,
            is24HourTimeFormat: false,
            areaDecoration: BoxDecoration(
              color: Colors.transparent
            ),
            hourMinuteDigitTextStyle: TextStyle(color: Color(0xFF155753),fontSize: 30,fontWeight: FontWeight.bold),
            amPmDigitTextStyle: TextStyle(color: Color(0xFF155753),fontWeight: FontWeight.bold),
            hourMinuteDigitDecoration: BoxDecoration(
              color: Colors.transparent
            ),
            showSecondsDigit: false,
            secondDigitDecoration: BoxDecoration(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
  Widget vectorWelcome(){
    return Positioned(
      top: ScreenUtil().setHeight(10),
      left: ScreenUtil().setWidth(420),
      child: Container(
        height: ScreenUtil().setHeight(1000),
        width: ScreenUtil().setWidth(1000),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/welcome.png'),
          )
        ),
      ),
    );
  }
  Widget pilihBahasa(){
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
        height: ScreenUtil().setHeight(600),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Pilih bahasa yang mau kamu terjemahkan',style: TextStyle(color: Color(0xFF666363),fontSize: 15),),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                boxBahasa(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>IndoToEnglish()));
                  },
                  color: Colors.blue,
                  icon: Icons.arrow_forward,
                  kata1: 'ID',
                  kata2: 'EN',
                  warnaHuruf: Colors.white
                ),
                boxBahasa(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EnglishToIndo()));
                  },
                  color: Colors.white,
                  icon: Icons.arrow_forward,
                  kata1: 'EN',
                  kata2: 'ID',
                  warnaHuruf: Colors.blue
                )
              ],
            )
          ],
        )
      ),
    );
  }
  Widget boxBahasa({GestureDragCancelCallback onTap,Color color,Color warnaHuruf,String kata1,String kata2,IconData icon}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 70,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: color,
            boxShadow: [
              BoxShadow(
                  offset: Offset(10,10),
                  color: Colors.black12,
                  blurRadius: 12
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(kata1,style: TextStyle(color: warnaHuruf,fontSize: 25,fontWeight: FontWeight.bold),),
            Icon(icon,color: warnaHuruf,size: 30,),
            Text(kata2,style: TextStyle(color: warnaHuruf,fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
