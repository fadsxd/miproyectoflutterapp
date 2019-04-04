import 'package:flutter/material.dart';

void main() => runApp(MyApp(
  home: MusicPlayer(),
  ));

  class MusicPlayer extends StatefulWidget{
    @override
    _MusicPlayerState createState() => _MUsicPlayerState();
  }

  class _MusicPLayerState extends State<MusicPlayer>{
    final audioName = "audio.mp3";
    final musicName = "Abc - 123";
    final imageURL = "https://f4.bcbits.com/img/a3215224860_16.jpg";
    
    @override
    Widget build(BuildContext context){
      return Container(

      );
    }
  }



  


  
