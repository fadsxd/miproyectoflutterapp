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
          children: audioControls(),
        )),
      );
    }
    Widget CreateIconButton(IconData icon,Color color, VoidCallback onPressed){
      return IconButton(
         icon: Icon(icon),
         iconSize: 64,
         color: color,
         onPressed: onPressed,
        );
    }

    List<Widget> audioControls(){
      return <Widget>[
          CreateIconButton(Icons.play_arrow,Colors.grey,()
        {
          audioCache.play(audioName);
        }),
        CreateIconButton(Icons.pause,Colors.green,()
        {
          audioPlayer.pause();
        }),
        CreateIconButton(Icons.stop,Colors.purple,()
        {
          audioPlayer.stop();
        })
      ];
    }
  }



  


  
