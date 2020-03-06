import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terjemahkeun_app/widget/translation_widget.dart';

class EnglishToIndo extends StatefulWidget {
  @override
  _EnglishToIndoState createState() => _EnglishToIndoState();
}

class _EnglishToIndoState extends State<EnglishToIndo> {
  File PickedImage;
  String wordText = '';
  String imageTrans = '';
  bool isImageLoaded = false;
  bool _showTranslateButtn =false;
  bool _showOriginalText = false;
  bool showTranslation = false;

  void pickImage()async{
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      PickedImage = temp;
      isImageLoaded = true;
    });
  }
  void readImage()async{
    setState(() {
      _showTranslateButtn = true;
    });
  }
  void translateImage()async{
    setState(() {
      showTranslation = true;
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
      wordTemp: wordText,
      showTranslation: showTranslation,
      imageTrans: imageTrans,
    );
  }
}
