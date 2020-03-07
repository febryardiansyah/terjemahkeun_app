import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';
import 'package:terjemahkeun_app/widget/translation_widget.dart';

class IndoToEnglish extends StatefulWidget {
  @override
  _IndoToEnglishState createState() => _IndoToEnglishState();
}

class _IndoToEnglishState extends State<IndoToEnglish> {
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
                  title: Text('Dari Galeri'),
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
                  title: Text('Dari Kamera'),
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
        isTextNull = 'Tidak ada teks di dalam gambar';
        return print('Tidak Ada ');
      }
    });
  }
  Future translateImage()async{
    await translator.translate(wordText,from: 'id',to: 'en').then((res){
      setState(() {
        imageTrans = res;
        showTranslation = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return TranslationWidget(
      judul: 'Indonesia ke Bahasa Inggris',
      isImageLoaded: isImageLoaded,
      pickedImage: PickedImage,
      gambarLoaded: 'TIdak ada gambar yang dipilih',
      tapAmbilGambar:(){
        pickImage();
      } ,
      ambilGambar: 'Ambil gambar',
      tapBacaGambar: (){
        readImage();
      },
      bacaGambar: 'Baca Teks',
      showTranslateBtn: _showTranslateButtn,
      terjemahkan: 'Terjemahkan',
      tapTranslateGambar: (){
        translateImage();
      },
      showOriginalText:_showOriginalText,
      originalText: 'Teks asli',
      wordTemp: ifTextnotNull?wordText:isTextNull,
      showTranslation: showTranslation,
      imageTrans: imageTrans.toString(),
      terjemahText: 'Terjemahan ke Bahasa Inggris',
    );
  }
}
