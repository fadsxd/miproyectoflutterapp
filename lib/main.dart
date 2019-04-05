import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(MaterialApp(
  home: MusicPlayer(),
  ));

  class MusicPlayer extends StatefulWidget{
    @override
    _MusicPlayerState createState() => _MusicPlayerState();
  }

  class _MusicPlayerState extends State <MusicPlayer>{
    final audioName = "audio.mp3";
    final musicName = "Abc - 123";
    final imageURL = "https://f4.bcbits.com/img/a3215224860_16.jpg";
    
    AudioPlayer audioPlayer;
    AudioCache audioCache;
    @override
      void initState(){
        
        super.initState();

        audioPlayer = AudioPlayer();
        audioCache = AudioCache(fixedPlayer: audioPlayer);

      }

    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Music Player", style: TextStyle(
          fontSize: 20,
        )),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 64,
          color: Colors.green,
          onPressed: (){
            audioCache.play(audioName);
          },
        ),
        IconButton(
          icon: Icon(Icons.pause),
          iconSize: 64,
          color: Colors.grey,
          onPressed: (){
            audioPlayer.pause();
          },
        ),
        ]
        )),
      );
    }
  }



  


  
