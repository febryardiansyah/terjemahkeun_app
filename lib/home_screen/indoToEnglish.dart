import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IndoToEnglish extends StatefulWidget {
  @override
  _IndoToEnglishState createState() => _IndoToEnglishState();
}

class _IndoToEnglishState extends State<IndoToEnglish> {
  File pickedImage;
  String wordText = '';
  String imgaeTrans = '';
  bool _isImageLoad = false;
  bool showTranslate = false;
  bool showOriginalText = false;
  bool showTranslatinon = false;

  void pickImage() async{
    var temp = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = temp;
      _isImageLoad = true;
    });
  }
  void readImage()async{
    setState(() {
      showTranslate = true;
      showOriginalText = true;
    });
  }
  void translateImage()async{
    setState(() {
      showTranslatinon = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indonesia Ke Bahasa Inggris'),
        backgroundColor: Color(0xFF33B6FF),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              _isImageLoad?Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(pickedImage),
                    fit: BoxFit.fill
                  )
                ),
              ):Center(child: Text('Tidak ada gambar yang dipilih'),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: (){
                        pickImage();
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        child: Center(child: Text('Ambil Gambar',style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: (){
                        readImage();
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        child: Center(child: Text('Baca Gambar',style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),
              showTranslate?Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: (){
                    translateImage();
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    child: Center(child: Text('Terjemahkan',style: TextStyle(color: Colors.white),),),
                  ),
                ),
              ):Center(),
              SizedBox(height: 20,),
              showOriginalText?Text('Text Asli',style: TextStyle(color: Colors.grey),):Container(),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                child: SelectableText(wordText,textAlign: TextAlign.justify,),
              ),
              showTranslatinon?Text('Terjemahan Ke Bahasa Inggris',style: TextStyle(color: Colors.grey),):Container(),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                child: SelectableText(imgaeTrans,textAlign: TextAlign.justify,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
