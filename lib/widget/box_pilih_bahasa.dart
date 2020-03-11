import 'package:flutter/material.dart';

class BoxPilihBahasa extends StatefulWidget {
  final GestureDragCancelCallback onTap;
  final Color warnaHuruf;
  final Color color;
  final String kata1,kata2;
  final IconData icon;

  const BoxPilihBahasa({Key key, this.onTap, this.color, this.kata1, this.kata2, this.icon,this.warnaHuruf}) : super(key: key);

  @override
  _BoxPilihBahasaState createState() => _BoxPilihBahasaState();
}

class _BoxPilihBahasaState extends State<BoxPilihBahasa> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 70,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: widget.color,
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
            Text(widget.kata1,style: TextStyle(color: widget.warnaHuruf,fontSize: 25,fontWeight: FontWeight.bold),),
            Icon(widget.icon,color: widget.warnaHuruf,size: 30,),
            Text(widget.kata2,style: TextStyle(color: widget.warnaHuruf,fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
