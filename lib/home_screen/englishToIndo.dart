import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terjemahkeun_app/widget/translation_widget.dart';
import 'package:translator/translator.dart';

class EnglishToIndo extends StatefulWidget {
  @override
  _EnglishToIndoState createState() => _EnglishToIndoState();
}

class _EnglishToIndoState extends State<EnglishToIndo> {
  File PickedImage;
  String wordText = '';
  String imageTrans = '';
  String isTextNull = '';
  bool ifTextnotNull = false;
  bool isImageLoaded = false;
  bool _showTranslateButtn =false;
  bool _showOriginalText = false;
  bool showTranslation = false;
  final GoogleTranslator translator = GoogleTranslator();

  Future pickImage()async{
    setState(() {
      _showTranslateButtn = false;
      _showOriginalText = false;
      showTranslation = false;
      wordText = '';
      imageTrans = '';
      isTextNull = '';
    });
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            color: Colors.white
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.image),
                title: Text('From Gallery'),
                onTap: ()async{
                  var temp = await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    if(temp != null){
                      PickedImage = temp;
                      isImageLoaded = true;
                      Navigator.pop(context);
                    }
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('From Camera'),
                onTap: ()async{
                  var temp = await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    if(temp != null) {
                      PickedImage = temp;
                      isImageLoaded = true;
                      Navigator.pop(context);
                    }
                  });
                },
              )
            ],
          ),
        );
      }
    );
  }
  Future readImage()async{
    final FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(PickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(myImage);
    for(TextBlock textBlock in visionText.blocks){
      for(TextLine textLine in textBlock.lines){
        for(TextElement textElement in textLine.elements){
          setState(() {
            wordText += textElement.text.toLowerCase() + ' ';
            print(wordText);
          });
        }
      }
    }
    setState(() {
      _showOriginalText = true;
      _showTranslateButtn = true;
      ifTextnotNull = true;
      if(wordText == ''){
        ifTextnotNull = false;
        isTextNull = "there's no Text on image";
        return print('Tidak Ada ');
      }
    });
  }
  Future translateImage()async{
    await translator.translate(wordText,from: 'en',to: 'id').then((res){
      setState(() {
        imageTrans = res;
        showTranslation = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return TranslationWidget(
      judul: 'English To Indonesia',
      isImageLoaded: isImageLoaded,
      pickedImage: PickedImage,
      gambarLoaded: 'No Image Selected',
      tapAmbilGambar:(){
        pickImage();
      } ,
      ambilGambar: 'Pick Image',
      tapBacaGambar: (){
        readImage();
      },
      bacaGambar: 'Read Text',
      showTranslateBtn: _showTranslateButtn,
      terjemahkan: 'Translate',
      tapTranslateGambar: (){
        translateImage();
      },
      showOriginalText:_showOriginalText,
      originalText: 'Original Text',
      wordTemp: ifTextnotNull?wordText:isTextNull,
      showTranslation: showTranslation,
      imageTrans: imageTrans.toString(),
      terjemahText: 'Translation to Indonesia',
    );
  }
}
