import 'dart:io';

import 'package:flutter/material.dart';

class TranslationWidget extends StatelessWidget {
  String judul;
  String gambarLoaded;
  String ambilGambar;
  String bacaGambar;
  String wordTemp;
  String imageTrans;
  String terjemahkan;
  String originalText;
  String terjemahText;
  File pickedImage;
  GestureTapCallback tapAmbilGambar;
  GestureTapCallback tapBacaGambar;
  GestureTapCallback tapTranslateGambar;
  bool isImageLoaded = false;
  bool showTranslateBtn = false;
  bool showOriginalText = false;
  bool showTranslation = false;


  TranslationWidget({this.judul, this.gambarLoaded, this.ambilGambar,
      this.bacaGambar, this.wordTemp, this.imageTrans, this.terjemahkan,
      this.pickedImage, this.tapAmbilGambar, this.tapBacaGambar,
      this.isImageLoaded, this.showTranslateBtn, this.showOriginalText,
      this.showTranslation, this.tapTranslateGambar,this.terjemahText,this.originalText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: Color(0xFF33B6FF),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              isImageLoaded?Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(pickedImage),
                    fit: BoxFit.fill
                  )
                ),
              ):Center(child: Text(gambarLoaded),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: tapAmbilGambar,
                      child: Container(
                        height: 30,
                        width: 100,
                        child: Center(child: Text(ambilGambar,style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: tapBacaGambar,
                      child: Container(
                        height: 30,
                        width: 100,
                        child: Center(child: Text(bacaGambar,style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ],
              ),
              showTranslateBtn?Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: tapTranslateGambar,
                  child: Container(
                    height: 30,
                    width: 100,
                    child: Center(child: Text(terjemahkan,style: TextStyle(color: Colors.white),),),
                  ),
                ),
              ):Center(),
              showOriginalText?Text(originalText,style: TextStyle(color: Colors.grey),):Container(),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                child: SelectableText(wordTemp,textAlign: TextAlign.justify,),
              ),
              showTranslation?Text(terjemahText,style: TextStyle(color: Colors.grey),):Container(),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                child: SelectableText(imageTrans,textAlign: TextAlign.justify,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
