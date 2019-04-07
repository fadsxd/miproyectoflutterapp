import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(MaterialApp(
  home: MusicPlayer(),
  theme: ThemeData.dark(),
  ));

  class MusicPlayer extends StatefulWidget{
    @override
    _MusicPlayerState createState() => _MusicPlayerState();
  }

  class _MusicPlayerState extends State <MusicPlayer>{
    final audioName = "audio1.mp3";
    final musicName = "Abc - 123";
    final imageURL = "https://f4.bcbits.com/img/a3215224860_16.jpg";
    
    Duration duration = Duration();
    Duration position = Duration();

    AudioPlayer audioPlayer;
    AudioCache audioCache;

    double volumen = 1;
    double currentVolume = 0;

    @override
      void initState(){
        
        super.initState();

        audioPlayer = AudioPlayer();
        audioCache = AudioCache(fixedPlayer: audioPlayer);

        audioPlayer.positionHandler = (p) => setState((){
          position = p;
        });
        audioPlayer.durationHandler = (p) => setState((){
          duration = p;
        });
      }

    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Music Player", style: TextStyle(
          fontSize: 20,
          color: Colors.yellow,
        )),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(musicName, style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: audioControls(),
            ),
            Image.network(imageURL),
            Slider(
            activeColor: Colors.green,
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              onChanged: (double seconds){
              setState(() {
                              audioPlayer.seek(Duration(seconds: seconds.toInt()));
                            });
              },
            )
          ],
        )),
      );
    }
    Widget CreateIconButton(IconData icon,Color color, VoidCallback onPressed){
      return IconButton(
         icon: Icon(icon),
         iconSize: 30,
         color: color,
         onPressed: onPressed,
        );
    }

    List<Widget> audioControls(){
      return <Widget>[
          CreateIconButton(Icons.play_arrow,Colors.grey,()
        {
            audioCache.play(audioName[0]);   
        }),
        CreateIconButton(Icons.pause,Colors.green,()
        {
          audioPlayer.pause();
        }),
        CreateIconButton(Icons.stop,Colors.purple,()
        {
          audioPlayer.stop();
        }),
        CreateIconButton(Icons.volume_up,Colors.orange,()
        {
          if(volumen < 1)
          {
            volumen += 0.1;
          audioPlayer.setVolume(volumen);
          }
          
        }),
        CreateIconButton(Icons.volume_down,Colors.orange,()
        {
          if(volumen != 0)
          {
            volumen -= 0.1;
          audioPlayer.setVolume(volumen);
          }
        }),
        CreateIconButton(Icons.volume_off,Colors.red,()
        {
          if(volumen != 0){
            currentVolume = volumen;
            volumen = 0;
          }else{
            volumen = currentVolume;
          }
          audioPlayer.setVolume(volumen);
        }),
        CreateIconButton(Icons.skip_next,Colors.black, ()
        {
          for (var i = 0; i < 3; i++) {
            audioPlayer.play(audioName);
          }
        })
      ];
    }
  }



  


  
