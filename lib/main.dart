import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

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
    
    AudioPlayer audioPLayer;
    AudioCache audioCache;
    @override
      void initState(){
        
        super.initState();

        audioPLayer = AudioPlayer();
        audioCache = AudioCache(fixedPlayer: audioPLayer);

      }


    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Music Player", style: TextStyle(
          fontSize: 20,
        )),
      ),
      );
    }
  }



  


  
