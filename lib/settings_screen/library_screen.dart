import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<String> _daftarLibrary = [
    'google_nav_bar: ^2.0.0',
    'flutter_screenutil: ^1.0.2',
    'intl: ^0.16.1',
    'slide_digital_clock: ^1.0.0',
    'firebase_ml_vision: ^0.9.3+8',
    'image_picker: ^0.6.3+4',
    'translator: ^0.1.4',
    'flutter_spinkit: ^3.1.0',
    'expansion_tile_card: ^1.0.2+2'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library yang digunakan'),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.only(top: 70),
            itemCount: _daftarLibrary.length,
            itemBuilder: (context, i){
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      elevation: 4,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                          child: Text(_daftarLibrary[i])),
                    )
                  ],
                ),
              );
            },
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Disini saya membuat aplikasinya tidak murni sendiri, saya menggunakan '
                  'beberapa Library/Package yang tersedia di Pub.dev. '
                  'berikut adalah beberapa Library yang saya gunakan : ',
                style: TextStyle(color: Colors.grey,),textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
