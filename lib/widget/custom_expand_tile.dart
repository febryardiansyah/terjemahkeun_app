import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CustomExpandTile extends StatefulWidget {
  IconData icon;
  String judul;
  String desk;
  CustomExpandTile({Key key,this.icon,this.judul,this.desk,}) : super(key:key);

  @override
  _CustomExpandTileState createState() => _CustomExpandTileState();
}
class _CustomExpandTileState extends State<CustomExpandTile> {
  bool tutup = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ExpansionTileCard(
        leading: CircleAvatar(child: Icon(widget.icon)),
        title: Text(widget.judul,style: TextStyle(fontSize: 13),),
        subtitle: !tutup?Text('Klik untuk melihat',style: TextStyle(color: Colors.grey),):Text('Klik untuk menutup',style: TextStyle(color: Colors.grey),),
        onExpansionChanged: (value){
          setState(() {
            tutup = value;
          });
        },
        children: <Widget>[
          Divider(thickness: 1,height: 1,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: Text(widget.desk,style: TextStyle(fontSize: 15),),
            ),
          )
        ],
      ),
    );
  }
}
